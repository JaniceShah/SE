<?php
	$conn = mysqli_connect('localhost','root','','Inventory');

    header('Content-type: application/json');
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Methods: PUT, GET, POST");
    header('Access-Control-Allow-Headers: X-Requested-With, content-type, access-control-allow-origin, access-control-allow-methods, access-control-allow-headers');
	
	$request_body = file_get_contents('php://input');
    $data = json_decode($request_body);
	//$upload = '4 - kjhgf';
	$upload = $data->name;
	$str_arr = explode ("-", $upload);
	$str_arr[0]=trim($str_arr[0]);
	$str_arr[1]=trim($str_arr[1]);
	$flag=0;
	$sql= "SELECT Quantity, FID FROM fooditems where MID='$str_arr[0]' ORDER BY MID";
	$result = mysqli_query($conn,$sql);
	while($row = mysqli_fetch_assoc($result)) {
		$sqli= "SELECT Available FROM stock where FID=".$row['FID'];
		$resulti = mysqli_query($conn,$sqli);
		$row1=mysqli_fetch_assoc($resulti);
		if($row1["Available"]<$row["Quantity"]){
			$flag=1;
			echo("1");
			break;
		}
	}
	$sql= "SELECT Quantity, FID FROM fooditems where MID='$str_arr[0]' ORDER BY MID";
	$result = mysqli_query($conn,$sql);
	if($flag!=1 and $str_arr[1]!=""){
		while($row = mysqli_fetch_assoc($result)) {
			$sqli= "SELECT Available FROM stock where FID=".$row['FID'];
			$resulti = mysqli_query($conn,$sqli);
			$row1=mysqli_fetch_assoc($resulti);
			$new=$row1['Available']-$row['Quantity']; 
			$sqlu="UPDATE stock SET Available=".$new." where FID=".$row['FID'];
			$resultu = mysqli_query($conn,$sqlu);
		}
		$sqlo = "INSERT INTO ordermenu(MID,Mname) VALUES ('$str_arr[0]','$str_arr[1]')";
		$resulto = mysqli_query($conn,$sqlo);
		echo("0");
	}
?>