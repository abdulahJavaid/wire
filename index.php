<?php // requiring the header of page
require_once("includes/header.php");
?>
<?php // requiring the slider of page
require_once("includes/slider.php");
?>

<!-- Section for supplire/wholesaler to view listed items -->
<section>

  <div class="padding-ws-index">
    <div class="row">
      <div class="col-auto">
        <div id="h3-ws-index">
          <h3 class="anton-regular">My listed items</h3>
        </div>
      </div>
    </div>
  </div>

  <div class="padding-ws-index">
    <div class="row">
      <div class="container-fluid">
        <div class="col-auto">
          <table class="table table-hover table-bordered">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Category 
                  <span class="tooltip">
                  <i class="bi bi-question-circle"></i>
                    <span class="tooltiptext">This is tooltip</span>
                  </span>
                </th>
                <th scope="col">Brand</th>
                <th scope="col">Price (pp)</th>
                <th scope="col">Quantity</th>
                <th scope="col">Sold</th>
                <th scope="col">Cost (unslod)</th>
                <th scope="col">Earnings (sold)</th>
                <th scope="col">Agreement expiry date</th>
                <th scope="col">View</th>
                <th scope="col">Add more quantity</th>
              </tr>
            </thead>
            <tbody>
              <?php
              // selecting all the listed items of this seller
              $query = "SELECT * FROM items INNER JOIN item_tracking ON ";
              $query .= "items.fk_item_tracking_id=item_tracking.item_tracking_id WHERE ";
              $query .= "fk_ws_id='1'";

              $result = mysqli_query($conn, $query);
              while ($row = mysqli_fetch_assoc($result)) {
                $q = $row['item_quantity'];
                $p = $row['item_price'];
                $s = $row['item_sold'];
                $i_p = $row['item_profit'];
                $profit = $p * $s;
                $pp = ($i_p/100)*$p;
                $profit += $pp;
                $t = $q * $p;
              ?>
                <tr>
                  <td><?php echo $row['item_category']; ?></td>
                  <td><?php echo $row['item_brand']; ?></td>
                  <td>Rs. <?php echo $row['item_price']; ?></td>
                  <td><?php echo $row['item_quantity']; ?></td>
                  <td><?php echo $row['item_sold']; ?></td>
                  <td>Rs. <?php echo $t; ?></td>
                  <td>Rs. <?php echo $profit; ?></td>
                  <td>
                    <?php
                    if ($row['agreement_date'] == '0000-00-00') {
                      echo "<code>under review</code>";
                    } else {
                      echo $row['agreement_date'];
                    }
                    ?>
                  </td>
                  <td><button class="btn btn-sm btn-danger">View</button></td>
                  <td><button class="btn btn-sm btn-danger">Add</button></td>
                </tr>

              <?php
                // end of loop to show listed items
              }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <!-- <div class="list-product">
    <div class="container">
      <div class="product_heading">
        <h2>
          Top Sale accorries
        </h2>
      </div>
      <div class="product_container">
        <div class="box">
          <div class="box-content">
            <div class="img-box">
              <img src="images/1.webp" alt="">
            </div>
            <div class="detail-box">
              <div class="text">
                <h6>
                  Men's Watch
                </h6>
                <h5>
                  <span>$</span> 300
                </h5>
              </div>
              <div class="like">
                <h6>
                  Like
                </h6>
                <div class="star_container">
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="btn-box">
            <a href="">
              Add To Cart
            </a>
          </div>
        </div>
        <div class="box">
          <div class="box-content">
            <div class="img-box">
              <img src="images/2.jpg" alt="">
            </div>
            <div class="detail-box">
              <div class="text">
                <h6>
                  Men's Watch
                </h6>
                <h5>
                  <span>$</span> 300
                </h5>
              </div>
              <div class="like">
                <h6>
                  Like
                </h6>
                <div class="star_container">
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="btn-box">
            <a href="">
              Add To Cart
            </a>
          </div>
        </div>
        <div class="box">
          <div class="box-content">
            <div class="img-box">
              <img src="images/3.jpg" alt="">
            </div>
            <div class="detail-box">
              <div class="text">
                <h6>
                  Men's Watch
                </h6>
                <h5>
                  <span>$</span> 300
                </h5>
              </div>
              <div class="like">
                <h6>
                  Like
                </h6>
                <div class="star_container">
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="btn-box">
            <a href="">
              Add To Cart
            </a>
          </div>
        </div>
      </div>
    </div>
    </div> -->
</section>

<!-- end product section -->


<!-- product section -->
<!-- 
  <section class="product_section ">
    <div class="container">
      <div class="product_heading">
        <h2>
          Feature Watches
        </h2>
      </div>
      <div class="product_container">
        <div class="box">
          <div class="box-content">
            <div class="img-box">
              <img src="images/4.jpg" alt="">
            </div>
            <div class="detail-box">
              <div class="text">
                <h6>
                  Men's Watch
                </h6>
                <h5>
                  <span>$</span> 300
                </h5>
              </div>
              <div class="like">
                <h6>
                  Like
                </h6>
                <div class="star_container">
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="btn-box">
            <a href="">
              Add To Cart
            </a>
          </div>
        </div>
        <div class="box">
          <div class="box-content">
            <div class="img-box">
              <img src="images/5.jpg" alt="">
            </div>
            <div class="detail-box">
              <div class="text">
                <h6>
                  Men's Watch
                </h6>
                <h5>
                  <span>$</span> 300
                </h5>
              </div>
              <div class="like">
                <h6>
                  Like
                </h6>
                <div class="star_container">
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="btn-box">
            <a href="">
              Add To Cart
            </a>
          </div>
        </div>
        <div class="box">
          <div class="box-content">
            <div class="img-box">
              <img src="images/6.jpg" alt="">
            </div>
            <div class="detail-box">
              <div class="text">
                <h6>
                  Men's Watch
                </h6>
                <h5>
                  <span>$</span> 300
                </h5>
              </div>
              <div class="like">
                <h6>
                  Like
                </h6>
                <div class="star_container">
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="btn-box">
            <a href="">
              Add To Cart
            </a>
          </div>
        </div>
      </div>
    </div>
  </section> -->


<!-- end product section -->


<!-- product section -->
<!-- 
  <section class="product_section ">
    <div class="container">
      <div class="product_heading">
        <h2>
          New Arrivals
        </h2>
      </div>
      <div class="product_container">
        <div class="box">
          <div class="box-content">
            <div class="img-box">
              <img src="images/7.jpg" alt="">
            </div>
            <div class="detail-box">
              <div class="text">
                <h6>
                  Men's Watch
                </h6>
                <h5>
                  <span>$</span> 300
                </h5>
              </div>
              <div class="like">
                <h6>
                  Like
                </h6>
                <div class="star_container">
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="btn-box">
            <a href="">
              Add To Cart
            </a>
          </div>
        </div>
        <div class="box">
          <div class="box-content">
            <div class="img-box">
              <img src="images/8.jpg" alt="">
            </div>
            <div class="detail-box">
              <div class="text">
                <h6>
                  Men's Watch
                </h6>
                <h5>
                  <span>$</span> 300
                </h5>
              </div>
              <div class="like">
                <h6>
                  Like
                </h6>
                <div class="star_container">
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="btn-box">
            <a href="">
              Add To Cart
            </a>
          </div>
        </div>
        <div class="box">
          <div class="box-content">
            <div class="img-box">
              <img src="images/10.jpg" alt="">
            </div>
            <div class="detail-box">
              <div class="text">
                <h6>
                  Men's Watch
                </h6>
                <h5>
                  <span>$</span> 300
                </h5>
              </div>
              <div class="like">
                <h6>
                  Like
                </h6>
                <div class="star_container">
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="btn-box">
            <a href="">
              Add To Cart
            </a>
          </div>
        </div>
      </div>
    </div>
  </section> -->


<!-- end product section -->

<!-- contact section -->
<!-- <section class="contact_section layout_padding">
    <div class="container">
      <div class="heading_container">
        <h2>
          Contact Us
        </h2>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="form_container">
            <form action="">
              <div>
                <input type="text" placeholder="Your Name" />
              </div>
              <div>
                <input type="text" placeholder="Phone Number" />
              </div>
              <div>
                <input type="email" placeholder="Email" />
              </div>
              <div>
                <input type="text" class="message-box" placeholder="Message" />
              </div>
              <div class="btn_box">
                <button>
                  SEND
                </button>
              </div>
            </form>
          </div>
        </div>
        <div class="col-md-6 ">
          <div class="map_container">
            <div class="map">
              <div id="googleMap"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> -->
<!-- end contact section -->

<?php // requiring the footer of page
require_once("includes/footer.php");
?>