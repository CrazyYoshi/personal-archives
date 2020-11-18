<?php
function echoBlocs($img){
	shuffle($img);
	$imgContent="";
	for($i=1;$i<=count($img);$i++){
		$url="url('".$img[$i-1]['preview']."')";
		$style=" style=\"background-image:$url;\"";
		
        $imgContent.="<div class=\"bubble\" $style>";
        $imgContent.="<div class=\"hiddenInfo\" id=\"titre\">".$img[$i-1]['titre']."</div>";
        $imgContent.="<div class=\"hiddenInfo\" id=\"description\">".$img[$i-1]['description']."</div>";
        $imgContent.="<div class=\"hiddenInfo\" id=\"src\">".$img[$i-1]['src']."</div>";
        $imgContent.="</div>";
        
	}
	echo $imgContent;
}
if(isset($_POST['goOn'])){
    mb_internal_encoding('UTF-8');
    $db = mysqli_connect('localhost', 'root', '', 'portfolio');
    mysqli_query($db,'SET NAMES UTF8');
    $requete = "SELECT * FROM `portfolio_entries` WHERE 1";
	$request = mysqli_query($db,$requete);
	mysqli_close($db);

	$numbRows=mysqli_num_rows($request);
	$i=0;
	$img=array();

	while($results = mysqli_fetch_assoc($request)){
		$img[$i]=array();
		$img[$i]['titre']=$results["titre"];
		$img[$i]['preview']=$results["preview"];
		$img[$i]['src']=$results["src"];
		$img[$i]['description']=$results["description"];
		$i++;
	}
	echoBlocs($img);


}
?>