<?php
header('Access-Control-Allow-Origin: *');
require 'connect.php';

$roadmap = $db->query("SELECT * FROM `roadmap_tasks` WHERE `parent` iS NULL")->fetchAll(PDO::FETCH_ASSOC);

foreach($roadmap as &$toplevel){
    $toplevel['childs'] = [];
    $childsQuery = "SELECT * FROM `roadmap_tasks` WHERE `parent` = {$toplevel['id']}";
    $childExe = $db->query($childsQuery);

if($childExe){
    foreach($childExe->fetchAll(PDO::FETCH_ASSOC) as &$row){

        $row['childs']= [];
        $childsQuery2 = "SELECT * FROM `roadmap_tasks` WHERE `parent` = {$row['id']}";
        foreach($db->query($childsQuery2)->fetchAll(PDO::FETCH_ASSOC) as &$row2){
            $row['childs'][] = $row2;
        }
        $toplevel['childs'][] = $row;
    }
}


}



header('Content-Type: application/json');
echo json_encode($roadmap,JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);


