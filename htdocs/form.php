<?php

	//Oracle DB user name
	$username = 'student';

	// Oracle DB user password
	$password = 'STUDENT';

	// Oracle DB connection string
	$connection_string = 'localhost/xe';

	//Connect to an Oracle database
	$connection = oci_connect(
	$username,
	$password,
	$connection_string
	);

	/*If (!$connection)
		echo 'The keks were not in your favour -- connection failed';
	else
		echo 'Praised be Kek! -- connection succesfull';
*/
?>

	<head>
		<title> Hello World! </title>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="myStyleIndex.css">
	</head>

	<body>	
		<div class="img" style="left: 45%;top: 30%;">
			<div class="button">
				<a>Create</a>
			</div>
		</div>
		<div class="img" style="left: 55%;top: 30%;">
			<div class="button">
				<a href="test_connection.html">Read</a>
			</div>
		</div>
		<div class="img" style="left: 65%;top: 30%;">
			<div class="button">
				<a>Update</a>
			</div>
		</div>
		<div class="img" style="left: 75%;top: 30%;">
			<div class="button">
				<a>Delete</a>
			</div>
		</div>
		<div class="b">
		<form action="form.php" method="post">
			Plane id:  <input type="text" name="plane_id" />
			Company name:  <input type="text" name="company_name" />
			Fabrication series:  <input type="text" name="fabrication_series" />
			Plane capacity:  <input type="text" name="plane_capacity" />
		</form>
	</div>
	</body>
	<?php
		$flag1=0;
		$flag2=0;
		$flag3=0;
		$flag4=0;
		if(isset($_POST['plane_id'])) { $var1 = $_POST['plane_id']; $flag1=1;}
		if(isset($_POST['company_name'])) { $var2 = $_POST['company_name']; $flag2=1;}
		if(isset($_POST['fabrication_series'])) { $var3 = $_POST['fabrication_series']; $flag3=1;}
		if(isset($_POST['plane_capacity'])) { $var4 = $_POST['plane_capacity']; $flag4=1;}
		if ($flag=1 && $flag2=0 && $flag3=0 && $flag4=0) {
			$s = oci_parse($connection, 'select plane_id from PLANE');
			oci_execute($s);
			oci_fetch_all($s, $res);
			echo "<pre>\n";
			echo "<br>\n";
			echo "<br>\n";
			echo "<br>\n";
			echo "<br>\n";
			var_dump($res);
			echo "</pre>\n";
		}
	
	?>
<?php
	// Close connection
	oci_close($connection);

?>