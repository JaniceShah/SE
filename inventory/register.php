<?php
	require 'dbconnection.php';
    header('Content-type: application/json');
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Methods: PUT, GET, POST");
    header('Access-Control-Allow-Headers: X-Requested-With, content-type, access-control-allow-origin, access-control-allow-methods, access-control-allow-headers');
	
	$request_body = file_get_contents('php://input');
    $data = json_decode($request_body);
	$name = $data->name;
	$pass = $data->pass;
	$role = $data->role;
	echo json_encode($request_body);
	if(mysqli_connect_error())
	{
		die('Connect Error ('.mysqli_connect_errno() .')'.mysqli_connect_error());
	}
	else{
		if($name!=""){
		$sql ="INSERT INTO users(uname,pass,role) values ('$name','$pass','$role')";
		}
	}
?>