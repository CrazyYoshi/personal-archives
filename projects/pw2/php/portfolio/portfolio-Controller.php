<?php
include('../functions/sql_connect.php');

include('portfolio-Model.php');
include('portfolio-View.php');

if(isset($_POST['getTags'])){
    mb_internal_encoding('UTF-8');
    $db = mysqli_connect('localhost', 'root', '', 'portfolio');

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


?>
