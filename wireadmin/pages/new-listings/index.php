<?php
require_once("../../../includes/init.php");
// redirectin the user to the login page

// getting the url of the page
$uri = "" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] . "";
if (str_contains($uri, '/wireadmin/pages/new-listings')) {
    header("Location: http://localhost/wire/wireadmin/pages/new-listings/new_listings.php");
}

?>