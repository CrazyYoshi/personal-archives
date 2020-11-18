<?php
header('Access-Control-Allow-Origin: *');
require 'connect.php';

$query ="";
$query .= "SELECT e.title as title, e.place, e.date_start, ";
$query .= "e.date_end, e.job, e.description as text, f.path as img, ";
$query .= "bg.code as bgcolor, c.code as color FROM experience e ";
$query .= "INNER JOIN files f ";
$query .= "ON e.logo = f.id ";
$query .= "INNER JOIN color bg ";
$query .= "ON e.`bg-color` = bg.id ";
$query .= "INNER JOIN color c ";
$query .= "ON e.color = c.id ";

$experience = $db->query($query)->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($experience,JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
