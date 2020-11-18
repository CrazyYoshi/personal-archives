<?php

include_once('contact-Model.php');
include_once('contact-View.php');

if(isset($_POST['EnvoyerMail']))
{
//    Dès que le formulaire est envoyé, on récupère les données et on génère un tableau d'information.
    $data['name'] = $_POST['name'];
    $data['mail'] = $_POST['email'];
    $data['mobi'] = (empty($_POST['phone']) ? 'None' : $_POST['phone']);
    $data['subj'] = $_POST['subj'];
    $data['cont'] = $_POST['message'];

    //    Il s'agit de votre mail, celui ou tout les message envoyé par le formulaire de contact doivent être soumis
    $data['webM'] = "mail@removed.com";

    contact($data);
}

?>
