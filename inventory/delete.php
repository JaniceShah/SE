<?php
    
    require 'dbconnection.php';

    header('Content-type: application/json');
	header("Access-Control-Allow-Origin: *");
    header('Access-Control-Allow-Headers: X-Requested-With, content-type, access-control-allow-origin, access-control-allow-methods, access-control-allow-headers');
    
    $request_body = file_get_contents('php://input');
    $data = json_decode($request_body);
	echo json_encode($request_body);
	$id = $data;
	echo($id);
	if(isset($data)){
        
		$sql = "Delete From ordermenu WHERE OID=".$id;
		$result = mysqli_query($conn,$sql);
    }
?>
