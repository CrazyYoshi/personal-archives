<?php
header('Access-Control-Allow-Origin: *');
require 'connect.php';

$data =[];

$portfolio = [];

$query = "SELECT DISTINCT p.id, p.date, p.description, o.path as original, pre.path as preview, p.title FROM `portfolio` as p
                         INNER JOIN files as o
                         ON p.original = o.id
                         INNER JOIN files as pre
                         ON p.preview = pre.id";



foreach($db->query($query)->fetchAll(PDO::FETCH_ASSOC) as $row){
    $projet = $row;
    $projet['tags'] = [];
    $projet['skills'] = [];
    $portfolio[] = $projet;
};

foreach($portfolio as &$entry){
    $tags = "SELECT t.id, t.tag as name FROM `portfolio_has_tags` as pt
         INNER JOIN tags as t
         ON pt.tags_id = t.id
         WHERE pt.portfolio_id = {$entry['id']}";
    $skills = "SELECT DISTINCT s.id, f.path as img, s.name FROM `portfolio_has_skills` as ps
               INNER JOIN skills as s
               ON ps.skills_id = s.id
               INNER JOIN files as f
               ON s.file = f.id
               WHERE ps.portfolio_id = {$entry['id']}";

    foreach($db->query($tags)->fetchAll(PDO::FETCH_ASSOC) as $row){
        $entry['tags'][] = $row;
    }
    foreach($db->query($skills)->fetchAll(PDO::FETCH_ASSOC) as $row){
        $entry['skills'][] = $row;
    }
}

$allSkills = $db->query("SELECT s.id, s.name, f.path as img FROM skills s INNER JOIN files f ON s.file = f.id")->fetchAll(PDO::FETCH_ASSOC);
$allTags = $db->query("SELECT id, tag as name FROM tags")->fetchAll(PDO::FETCH_ASSOC);

$data['portfolio']=$portfolio;
$data['skills']=$allSkills;
$data['tags']=$allTags;



header('Content-Type: application/json');
echo json_encode($data,JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);


