<?php
require_once("../includes/init.php");
// redirectin the user to the index page of the dashboard

// getting the url of the page
$uri = "" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] . "";
if (str_contains($uri, '/wireadmin')) {
    header("Location: http://localhost/wire/wireadmin/pages/index");
}