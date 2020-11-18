<?php
    mb_internal_encoding('UTF-8');

    $db = mysqli_connect('localhost', 'root', '', 'portfolio');
    mysqli_query($db,'SET NAMES UTF8');

?>
