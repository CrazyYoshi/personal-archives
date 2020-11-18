<?php
$year = date('Y');
$header = "<!DOCTYPE HTML><html><head><title>portfolio</title>";
$header.= "<meta charset='utf-8'><style>input[type='text'],input[type='number'],form{min-width:500px; margin : 5px auto 5px auto;}</style></head><body>";
$form  = "<form method=\"post\" action=\"addCreations.php\" enctype=\"multipart/form-data\">";
$form .= "<input type=\"text\" name=\"titre\"       value=\"\" placeholder=\"TITRE\" requiredNO=\"requiredNO\" /><br/>";
$form .= "<input type=\"number\" name=\"year\"      value=\"\" min=\"2013\" max=\"$year\" requiredNO=\"requiredNO\" /><br/>";
$form .= "SOURCE FICHIER    <input type=\"file\" name=\"srcfile\"  requiredNO=\"requiredNO\" /><br/>";
$form .= "                  <input type=\"text\" name=\"srcurl\"   requiredNO=\"requiredNO\" value=\"/portfolioPreviews/\" placeholder=\"LIEN\"/><br/>";
$form .= "                  <input type=\"text\" name=\"pvwurl\"  requiredNO=\"requiredNO\" value=\"/portfolioPreviews/\" placeholder=\"Preview/LIEN\"/><br/>";
$form .= "Preview FICHIER    <input type=\"file\" name=\"pvwfile\"  requiredNO=\"requiredNO\" /><br/>";
$form .=               "<input type=\"checkbox\" name=\"tag[]\" value=\"graphisme\">graphisme<br/>
                        <input type=\"checkbox\" name=\"tag[]\" value=\"PAO\"> PAO<br/>
                        <input type=\"checkbox\" name=\"tag[]\" value=\"artwork\"> artwork<br/>
                        <input type=\"checkbox\" name=\"tag[]\" value=\"personnel\"> personnel<br/>
                        <input type=\"checkbox\" name=\"tag[]\" value=\"logo\"> logo<br/>
                        <input type=\"checkbox\" name=\"tag[]\" value=\"site\"> site<br/>
                        <input type=\"checkbox\" name=\"tag[]\" value=\"pro\"> pro<br/>
                        <input type=\"checkbox\" name=\"tag[]\" value=\"étudiant\">étudiant<br/>
                        <input type=\"checkbox\" name=\"tag[]\" value=\"multimédia\"> multimédia<br/>";

$form .= "<textarea  style='width:500px; margin : auto ; min-height:500px; min-width:500px' name=\"desc\" placeholder=\"Blabla\" requiredNO=\"requiredNO\"></textarea><br/>";
$form .= "<button name='submit' type=\"submit\" value=\"Envoyer!\" >Envoyer</button></form>";
$footer = "</body></html>";

echo $header.$form.$footer;


//if($_SESSION['admin']){
//    echo $header.$form.$footer;
//}
//else{
//    echo $header.$connexion.$footer;
//}
//


$connexion = "<form method=\"post\" action=\"addCreations.php\">";
$connexion.="<input type=\"text\" name=\"login\" value=\"\" placeholder=\"login\" required=\"required\" /><br/>";
$connexion.="<input type=\"text\" name=\"pass\" value=\"\" placeholder=\"pass\" required=\"required\" /><br/>";
$connexion.="<button name='connect' type=\"submit\" value=\"Envoyer!\" >Se Connecter</button></form>";


if (isset($_POST['submit'])){
    mb_internal_encoding('UTF-8');

    //UPLOAD FICHIERS / TRAITEMENTS LIENS 
    $directory = $directorySRC = $directoryPreview = "../portfolioPreviews/";
    $srcOk = false;
    $pvwOk = false;
    
    if($_POST['srcurl']=='/portfolioPreviews/'){
        unset($_POST['srcurl']);
        echo "<br/>Cleaned source Url";
    }
    if($_POST['pvwurl']=='/portfolioPreviews/'){
        unset($_POST['pvwurl']);
        echo "<br/>Cleaned preview Url";
    }
    
    //FICHIER SOURCE
    if((isset($_FILES['srcfile']) && ($_FILES['srcfile']['error'] == UPLOAD_ERR_OK)) || !empty($_POST['srcurl']) ){
        if(empty($_POST['srcurl'])){
            $directorySRC .= $_FILES['srcfile']['name'];
            move_uploaded_file($_FILES['srcfile']['tmp_name'], $directorySRC);
            $srcOk = true;
            echo "Source uploadé";

        }
        else if(!empty($_POST['srcurl'])){
            $directorySRC = $_POST['srcurl'];
            $srcOk = true;
        }
        else{
            echo "<br/>C'est soit l'un soit l'autre mais pas les deux --' SRC";
            unset($directorySRC);
        }
        
        //FICHIER PREVIEW
        if(isset($_FILES['pvwfile']) && ($_FILES['pvwfile']['error'] == UPLOAD_ERR_OK)){
            if($_FILES['pvwfile']!=$_FILES['srcfile']){
                $directoryPreview.=$_FILES['pvwfile']['name'];
                move_uploaded_file($_FILES['pvwfile']['tmp_name'], $directoryPreview);
                $pvwOk = true;
                echo "<br/>Preview uploaded";

            }
            else{
                echo "<br/>Same files uploaded";
                $directoryPreview=$directorySRC;
                $pvwOk = true;

            }
        }
        else if(!empty($_POST['pvwurl'])){
            $directoryPreview = $_POST['pvwurl'];
            echo "<br/>Preview à l'adresse $directoryPreview";
            $pvwOk = true;
        }
        else{
            $directoryPreview = $directorySRC;
            echo "<br/>No preview location defined, affecting the source location as the preview location";
            $pvwOk = true;

        }

    }
    
    
    if($pvwOk==true && $srcOk==true){

        $db = mysqli_connect('localhost', 'root', '', 'portfolio') OR die(mysqli_error($db));
        mysqli_query($db,'SET NAMES UTF8');


        $requete ="INSERT INTO `portfolio_entries`(`art_id`, `titre`, `description`, `src`, `preview`, `year`)";
        $requete .=" VALUES (0,'{$_POST['titre']}','{$_POST['desc']}','{$directorySRC}','{$directoryPreview}','{$_POST['year']}')";
        $done=mysqli_query($db,$requete)  OR die(mysqli_error($db));
        if($done){
            $requete2 = "SELECT `art_id` FROM `portfolio_entries` WHERE `src` ='$directorySRC'";
            $results2 = mysqli_query($db,$requete2) OR die(mysqli_error($db));
            $results2 = mysqli_fetch_assoc($results2);
            $id = $results2['art_id'];
            if(isset($id)){

                var_dump ($id);
                for($i=0;$i<sizeof($_POST['tag']);$i++){
                    echo sizeof($_POST['tag']);
                    $requeteInsertion = "INSERT INTO `portfolio_tagsPerArts`(`art_id`, `tag`) VALUES ($id,'{$_POST['tag'][$i]}')";
                    mysqli_query($db,$requeteInsertion) OR die(mysqli_error($db));
                }
            }
        }

        mysqli_close($db);
    }
}
?>