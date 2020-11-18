<?php
function contact($data)
{

//    On génère le mail a envoyé.
    $headers  = "From: \"{$data['name']}\"<{$data['mail']}>\n";
    $headers .= "Reply-To: {$data['mail']}\n";
    $headers .= "Content-Type: text/html; charset=\"utf-8\"";

    $subject  = "MMAAMAR.COM Contact : ".$data['subj'];

    $mailContent = "Mail from : {$data['name']}, Tel : {$data['mobi']} \n";
    $mailContent .=$data['cont'];

    mail($data['webM'], $subject, $mailContent, $headers);
    echo 'Message envoyé';
}
?>
