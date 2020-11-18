<?php
header('Access-Control-Allow-Origin: *');
require 'connect.php';

$infos = $db->query("SELECT json FROM misc_json WHERE data_nature = \"personal\"")->fetchAll(PDO::FETCH_ASSOC);



header('Content-Type: application/json');



echo json_encode(json_decode($infos[0]['json']),JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);



