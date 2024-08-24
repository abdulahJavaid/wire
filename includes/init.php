<?php // all the necessary files needed for our project

// session start
session_start();
// output buffering start
ob_start();

// the connection configuration file
require_once(__DIR__ . "/../connection/configs.php");
// the database connection file
require_once(__DIR__ . "/../connection/connection.php");




?>