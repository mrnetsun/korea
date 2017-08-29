<?php

class Database {

	// Function to the database and tables and fill them with the default data
	function create_database($data)
	{
		// Connect to the database
		$mysqli = new mysqli($data['hostname'],$data['username'],$data['password'],'');

		// Check for errors
		if(mysqli_connect_errno())
			return false;

		// Create the prepared statement
		$mysqli->query("CREATE DATABASE IF NOT EXISTS ".$data['database']);

		// Close the connection
		$mysqli->close();

		return true;
	}

	// Function to create the tables and fill them with the default data
	function create_tables($data)
	{
//		// Connect to the database
//		$mysqli = new mysqli($data['hostname'],$data['username'],$data['password'],$data['database']);
//
//		// Check for errors
//		if(mysqli_connect_errno())
//			return false;
//
//        // Open the default SQL file
//        $query = file_get_contents('assets/schema.sql');
//
//        // Execute a multi query
//        $mysqli->query($query);
//
//		// Open the default SQL file
//		$query = file_get_contents('assets/install.sql');
//
//		// Execute a multi query
//		$mysqli->query($query);
//
//		// Close the connection
//		$mysqli->close();

        //Restore the database
        $databasefilename = realpath('assets/install.sql');
        $mysql_host= $data['hostname'];
        $mysql_username= $data['username'];
        $mysql_password = $data['password'];
        $db_name =$data['database'];
        $conn = mysql_connect( $mysql_host, $mysql_username, $mysql_password ) or die('Error connecting to MySQL server: ' . mysql_error());


        mysql_select_db($db_name);
        $qry = file_get_contents($databasefilename);
        mysql_query($qry, $conn)or die(mysql_error());
        mysql_close($conn);

        return true;
	}
}