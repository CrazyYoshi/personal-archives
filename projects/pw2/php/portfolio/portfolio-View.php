<?php

function echoBlocs($img){
    shuffle($img);
    $imgContent="";
    for($i=0;$i<count($img);$i++){
        $url=$img[$i]['preview'];
        $style=" style=\"background-image:$url;\"";

        $imgContent.="<figure>";
        $imgContent.="<img src=$url alt='{$img[$i]['titre']}'>";
        $imgContent.="<figcaption>{$img[$i]['titre']}</figcaption>";
        $imgContent.="</figure>";

    }
    echo $imgContent;
}

?>
