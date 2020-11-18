<?php
header('Access-Control-Allow-Origin: *');
require 'connect.php';

$leisures = $db->query("SELECT * FROM leisures")->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($leisures,JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);


