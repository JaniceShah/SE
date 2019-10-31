<?php
    
    require 'dbconnection.php';

    header('Content-type: application/json');
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Methods: PUT, GET, POST, UPDATE, HEAD, OPTIONS");
    header('Access-Control-Allow-Headers: X-Requested-With, content-type, access-control-allow-origin, access-control-allow-methods, access-control-allow-headers');
	
	$request_body = file_get_contents('php://input');
    $data = json_decode($request_body);
	echo json_encode($request_body);
	
	foreach($data as $key => $value){
		$name = $value[1];
		$quant = $value[2];
		
		if(isset($data)){
				$sql = "INSERT INTO stock( Fname,Available) VALUES ('$name','$quant')";
				$result = mysqli_query($conn,$sql);
			}
		}
?>