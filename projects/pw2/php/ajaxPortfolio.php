<?php

include('functions/sql_connect.php');

function echoBlocs($img){
    shuffle($img);
    $imgContent="";
    for($i=0;$i<count($img);$i++){
        $url=$img[$i]['preview'];
        $style=" style=\"background-image:$url;\"";

        $imgContent.="<figure>";
        $imgContent.="<img src=$url alt='{$img[$i]['titre']}'>";
        $imgContent.="<figcaption>{$img[$i]['titre']}</figcaption>";
        $imgContent.="<p id='year'>{$img[$i]['year']}</p>";
        $imgContent.="<p id='tag'>{$img[$i]['tag']}</p>";
        $imgContent.="<p id='src'>{$img[$i]['src']}</p>";
        $imgContent.="<p id='description'>{$img[$i]['description']}</p>";
        $imgContent.="</figure>";

    }
    echo $imgContent;
}


if(isset($_POST['getTags'])){

    global $db;

    $requete = "SELECT DISTINCT `tag` FROM `portfolio_tagsPerArts` WHERE 1";
    $request = mysqli_query($db,$requete);

    $tagsMenu="<li>Tout</li>";
    while($results = mysqli_fetch_assoc($request)){
        $tagsMenu.="<li>{$results['tag']}</li>";
    }
    echo $tagsMenu;
}

if(isset($_POST['goOn'])){
    global $db;

    if($_POST['goOn']=='Tout'){
        $requete = "SELECT * FROM `portfolio_entries` WHERE 1";
    }
    else{
        $requete  = "SELECT * ";
        $requete .= "FROM portfolio_entries portfolio ";
        $requete .= "INNER JOIN portfolio_tagsPerArts tags ";
        $requete .= "ON tags.art_id = portfolio.art_id ";
        $requete .= "WHERE tags.tag = '{$_POST['goOn']}'";
    }

    $request = mysqli_query($db,$requete);

    $numbRows=mysqli_num_rows($request);
    $i=0;
    $img=array();

    while($results = mysqli_fetch_assoc($request)){
        $img[$i]=array();

        $img[$i]['titre']=$results["titre"];

        $img[$i]['src']=$results["src"];
        $img[$i]['year']=$results["year"];
        $img[$i]['description']=$results["description"];

        $img[$i]["tag"]='';

        $getThetags= "SELECT `tag` FROM `portfolio_tagsPerArts` WHERE `art_id` = '{$results['art_id']}'";
        $getThetags = mysqli_query($db,$getThetags);

        while($tags = mysqli_fetch_assoc($getThetags)){
            $img[$i]['tag'] .=$tags['tag']." / ";
        }
        $img[$i]['preview']=$results["preview"];

        $i++;
    }
    echoBlocs($img);


}
?>
