<?php

function echoBlocs($img){
    shuffle($img);
    $imgContent="";
    for($i=0;$i<count($img);$i++){
        $url="url('{$img[$i]['preview']}')";
        $style=" style=\"background-image:$url;\"";

        $imgContent.="<div class=\"artBox\" name=\"{$img[$i]['titre']}\" $style>";
        $imgContent.="<div class=\"hidden name\">{$img[$i]['titre']}</div>";
        $imgContent.="<div class=\"hidden type\">{$img[$i]['tag']}</div>";
        $imgContent.="<div class=\"hidden desc\">{$img[$i]['description']}</div>";
        $imgContent.="<div class=\"hidden src\">{$img[$i]['src']}</div>";
        $imgContent.="<div class=\"hidden year\">{$img[$i]['year']}</div>";
        $imgContent.="</div>";

    }
    echo $imgContent;
}


if(isset($_POST['getTags'])){
    mb_internal_encoding('UTF-8');
    $db = mysqli_connect('localhost', 'root', '', 'portfolio') OR die(mysqli_error($db));

    mysqli_query($db,'SET NAMES UTF8');
    $requete = "SELECT DISTINCT `tag` FROM `portfolio_tagsPerArts` WHERE 1";
    $request = mysqli_query($db,$requete);
    mysqli_close($db);

    $tagsMenu="<li>Tout</li>";
    while($results = mysqli_fetch_assoc($request)){
        $tagsMenu.="<li>{$results['tag']}</li>";
    }
    echo $tagsMenu;
}

if(isset($_POST['goOn'])){
    mb_internal_encoding('UTF-8');
    $db = mysqli_connect('localhost', 'root', '', 'portfolio') OR die(mysqli_error($db));

    mysqli_query($db,'SET NAMES UTF8');
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
    mysqli_close($db);


}
?>