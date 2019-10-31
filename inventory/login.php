<?php

	require 'dbconnection.php';
	header('Content-type: application/json');
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Methods: PUT, GET, POST");
    header('Access-Control-Allow-Headers: X-Requested-With, content-type, access-control-allow-origin, access-control-allow-methods, access-control-allow-headers');
	$request_body = file_get_contents('php://input');
    $data = json_decode($request_body);
	
	$uname =  $data->name;
	$password = $data->pass;
	
	$sql = "select role from users where uname='". $uname. "'And pass='" .$password."' limit 1";
	$result = mysqli_query($conn, $sql);
	$row1=mysqli_fetch_assoc($result);
	if(mysqli_connect_error())
	{
		die('Connect Error ('.mysqli_connect_errno() .')'.mysqli_connect_error());
	}

	if(mysqli_num_rows($result) >0){
			
	if($row1["role"]=="manager"){
			echo("1");
		}
		else{
			echo("0");
		}
	}
	else{
	  echo "2";
	}
?>