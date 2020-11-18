<?php
header('Access-Control-Allow-Origin: *');
require 'connect.php';

$tags = $db->query("SELECT id, tag as name FROM tags")->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($tags,JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);


