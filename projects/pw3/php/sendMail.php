<?php
header('Access-Control-Allow-Origin: *');

$email = $_POST['email'];
$name = $_POST['name'];
$subject = $_POST['subject'];
$mail = $_POST['mail'];

$admin_email = "mail@removed.com";

$response = array();

if (!empty($email) && !empty($name) && !empty($subject) && !empty($mail)) {
//    On génère le mail a envoyé.
    $headers = "From: mail@removed.com \n";
    $headers .= "Reply-To: {$email}\r\n";
    $headers .= "Cc: $admin_email \r\n";
    $headers .= "Content-Type: text/html; charset=\"utf-8\" \r\n";

    $subject = "Formulaire@ProjectSunrise : $subject";

    $mailContent = "Mail from : {$name}, \r\n";
    $mailContent .= $mail;

    
    $response['error'] = "Envoi de mail desactivé";

} else {
    $response['error'] = "Un champ n'a pas été remplis.";
}


//header('Content-Type: application/json');
echo json_encode($response);
