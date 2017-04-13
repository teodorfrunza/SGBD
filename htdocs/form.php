<?php
		$plane_id=htmlspecialchars($_POST["plane_id"]);
		$company_name=htmlspecialchars($_POST["company_name"]);
		$fab_ser=htmlspecialchars($_POST["fabrication_series"]);
		$capac=htmlspecialchars($_POST["plane_capacity"]);
		$s = oci_parse($connection, 'select * from FLIGHT where plane_id=:plane_id');
			oci_execute($s);
			oci_fetch_all($s, $res);
			echo "<pre>\n";
			echo "<br>\n";
			echo "<br>\n";
			echo "<br>\n";
			echo "<br>\n";
			var_dump($res);
			echo "</pre>\n";
	
	?>
<?php
	// Close connection
	oci_close($connection);

?>