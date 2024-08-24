<?php
include "./connection/configs.php";
include "./connection/connection.php";
?>
<?php
session_start();
// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $ws_email = $_POST["ws_email"];
    $ws_password = $_POST["ws_password"];

    // Query to retrieve user from signup table
    $sql = "SELECT * FROM wholesaler WHERE ws_email = '$ws_email' AND ws_password = '$ws_password'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) == 1) {
        // Set session variables
        $_SESSION["loggedin"] = true;
        $_SESSION["email"] = $ws_email;

        // Redirect to dashboard or any other secure page
        header("Location: ./index.php");
        exit;
    } else {
        // Redirect back to the login page with error parameter
        header("Location: login.php?error=1");
        exit;
    }
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

  <title>HandTime</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

  <!-- bs -->
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
    <!-- header section starts -->
    <header class="header_section">
      <div class="navbar1">
        <div class="container-fluid">
          <nav class="navbar navbar-expand-lg custom_nav-container">
            <a class="navbar-brand" href="index.html">
              <span>HandTime</span>
            </a>
          </nav>
        </div>
      </div>
    </header>
    <!-- end header section -->

    <section class="h-100 bg-light">
      <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col">
            <div class="card card-registration bg-dark my-4">
              <div class="row g-0">
                <div class="col-xl-6 d-none d-xl-block">
                  <img src="images/banner.jpeg" alt="Sample photo" class="img-fluid"
                    style="width: 100%; height: 100%; object-fit: cover; border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
                </div>
                <div class="col-xl-6">
                  <div class="card-body p-md-2 text-black">
                    <h3 class="mb-5 text-uppercase mt-5 text-center ">Supplier Login</h3>

                    <!-- Form starts here -->
                    <form action="" method="POST" enctype="multipart/form-data">
                      <br>
                      <div data-mdb-input-init class="form-outline">
                        <input type="text" id="form3Example99" name="ws_email" class="form-control form-control-sm" required />
                        <label class="form-label" for="form3Example99">Email Address</label>
                      </div>

                      <div data-mdb-input-init class="form-outline">
                        <input type="text" id="form3Example97" name="ws_password" class="form-control form-control-sm" required />
                        <label class="form-label" for="form3Example97">Password</label>
                      </div>

                      <div class="d-flex justify-content-end pt-2">
                        <button type="reset" data-mdb-button-init data-mdb-ripple-init class="btn btn-light btn-sm" style="margin-right: 8px;">Reset</button>
                        <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-danger btn-sm">Submit</button>
                      </div>

                      <?php
                      // Display error message if login fails
                      if (isset($_GET["error"])) {
                          echo "<p class='text-danger mt-3 text-center'>Invalid email or password.</p>";
                      }
                      ?>
                    </form>
                    <!-- Form ends here -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

  <!-- jQuery -->
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script type="text/javascript" src="js/bootstrap.js"></script>
  <!-- custom js -->
  <script type="text/javascript" src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->

</body>

</html>
<?php // requiring the footer of page
require_once("includes/footer.php");
?>