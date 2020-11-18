<?php
header('Access-Control-Allow-Origin: *');
require 'connect.php';

$skills = $db->query("SELECT s.id, s.name, f.path as img FROM skills s INNER JOIN files f ON s.file = f.id")->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($skills,JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);


