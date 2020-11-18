<?php
header('Access-Control-Allow-Origin: *');
require 'connect.php';

$query ="";
$query .= "SELECT f.id, f.name, f.path as img ";
$query .= "FROM files f ";
$query .= "INNER JOIN file_nature fn ";
$query .= "ON f.file_nature_id = fn.id ";
$query .= "WHERE fn.nature = 'Photographie'";
$query .= "ORDER BY RAND()";
$query .= "LIMIT 10";



$bgimages = $db->query($query)->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($bgimages,JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
