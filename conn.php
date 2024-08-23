
<?php
$host="localhost";
$user="root";
$password='';
$database="_wire_project_";
$conn= mysqli_connect($host,$user,$password,$database);
if (!$conn){
    die("connection failed: ". mysqli_error());

}
?>