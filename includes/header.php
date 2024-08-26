<?php // requiring the init file
require("includes/init.php");
?>
<?php
// checking session if the user is logged in
$uri = "" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] . "";
if (!str_contains($uri, 'signup.php') && !str_contains($uri, 'login.php')) {
  if (!$_SESSION['logged_in']) {
    header("Location: ./login.php");
  }
}elseif (str_contains($uri, 'signup.php') || str_contains($uri, 'login.php')) {
  if(isset($_SESSION['logged_in'])){
  if ($_SESSION['logged_in']) {
    header("Location: ./");
  }}
}
?>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <link rel="icon" href="images/fevicon/fevicon.png" type="image/gif" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Wire</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
  <!-- google font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">

  <!-- bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

</head>

<body>

  <div class="hero_area">
    <!-- header section strats -->
    <header class="header_section"  style="position: fixed; width: 100%; z-index: 2;">
      <div class="navbar1">
        <div class="container-fluid">

          <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="">
              <span>
                Wire
                <!-- <h1 class="anton-regulr">Wire</h1> -->
              </span>
            </a>
            <?php
            // getting the url of the page
            $uri = "" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] . "";

            // if the url is not signup.php page then shoe nav links
            if (!str_contains($uri, 'signup.php') && !str_contains($uri, 'login.php')) {
            ?>
              <button class="navbar-toggler" style="background: red;" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class=""> </span>
              </button>

              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav  ">
                  <li class="nav-item">
                    <a class="nav-link anton-regular" href="./index.php">Home <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link anton-regular" href="./list-product.php">List Product</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link anton-regular" href="product.html">Products</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link anton-regular" href="product.html"> <i class="fa fa-user" aria-hidden="true"></i></a>
                  </li>
                </ul>
                <!-- <div class="user_optio_box">
                  <a href=""> PRofile
                    <i class="fa fa-user" aria-hidden="true"></i>
                  </a>
                </div> -->
              </div>
            <?php
              // closing the if statement (url page check)
            }
            ?>
          </nav>
        </div>
      </div>
    </header>
    <!-- end header section -->