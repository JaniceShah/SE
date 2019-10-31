<?php
    
    require 'dbconnection.php';

	header("Access-Control-Allow-Origin: *");
    header('Content-type: application/json');
	header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
	header('Access-Control-Allow-Headers: X-PINGOTHER,X-Requested-With, Content-type, access-control-allow-origin, access-control-allow-methods, access-control-allow-headers');
    $request_body = file_get_contents('php://input');
    $data = json_decode($request_body);
	$upload = $data->uploading;
	
    echo json_encode($request_body);
    if(isset($data)){
        
    $sql = "INSERT INTO test(upload) VALUES ('$upload')";
    $result = mysqli_query($conn,$sql);
    
    }
?>