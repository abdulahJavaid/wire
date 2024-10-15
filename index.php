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
          <div class="table-responsive">
            <table class="table table-info table-hover table-bordered border-info">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">Brand</th>
                  <th scope="col">Category</th>
                  <th scope="col">Item Number</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Price (pp)</th>
                  <th scope="col">Profit (pp)</th>
                  <th scope="col">Cost</th>
                  <th scope="col">Agreement date</th>
                  <th scope="col">More quantity</th>
                  <th scope="col">Details</th>
                </tr>
              </thead>
              <tbody>
                <?php
                // selecting all the listed items of this seller
                $id = escape($_SESSION['ws_id']);
                $query = "SELECT * FROM items INNER JOIN item_tracking ON ";
                $query .= "items.fk_item_tracking_id=item_tracking.item_tracking_id WHERE ";
                $query .= "fk_ws_id='$id' AND NOT item_status='rejected'";

                $result = mysqli_query($conn, $query);

                if (mysqli_num_rows($result) == 0) {
                  // code to show if the table is empty
                ?>
                  <tr>
                    <td colspan="10">
                      <div class="row text-center">
                        <div class="col-md-6 offset-md-3 col-8 offset-2">
                          <div class="alert alert-success"><strong>
                              Getting started? We are here to help you, list your first item <a href="./list-product.php">here</a> &#x1F448;
                            </strong></div>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <?php
                } else { // if there is sell record

                  // to fetch sell records of the listed items
                  while ($row = mysqli_fetch_assoc($result)) {
                    $quantity = $row['item_quantity']; // quantity
                    $price = $row['item_price']; // price
                    $total = $quantity * $price; // total amount for unsold quantity

                    $profit = $row['item_profit']; // profit per piece
                    $profit_rs = ($profit / 100) * $price; // profit in rupees
                  ?>
                    <tr>
                      <td><?php echo $row['item_brand']; ?></td>
                      <td><?php echo $row['item_category']; ?></td>
                      <td><?php echo $row['item_number']; ?></td>
                      <td><?php echo $row['item_quantity']; ?></td>
                      <td>Rs.<?php echo $row['item_price']; ?></td>
                      <td>Rs.<?php echo $profit_rs; ?> (<?php echo $row['item_profit']; ?>%)</td>
                      <td>Rs.<?php echo $total; ?></td>
                      <td>
                        <?php
                        if ($row['item_status'] == 'review') {
                          echo "<code>under review</code>";
                        } else {
                          echo $row['agreement_date'];
                        }
                        ?>
                      </td>
                      <td><button class="btn btn-sm btn-danger bg-red">Add</button></td>
                      <td><button class="btn btn-sm btn-danger bg-red">View</button></td>
                    </tr>

                <?php
                    // end of loop to show listed items
                  }
                  // end of else {if there is record}
                }
                ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- End section to view listed items -->

<!-- Section for supplire/wholesaler to view sold items -->
<section>

  <div class="padding-ws-index">
    <div class="row">
      <div class="col-auto">
        <div id="h3-ws-index">
          <h3 class="anton-regular">Sold Items</h3>
        </div>
      </div>
    </div>
  </div>

  <div class="padding-ws-index">
    <div class="row">
      <div class="container-fluid">
        <div class="col-auto">
          <div class="table-responsive">
            <table class="table table-info table-hover table-bordered border-info">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">Brand</th>
                  <th scope="col">Category</th>
                  <th scope="col">Item Number</th>
                  <th scope="col">Items Sold</th>
                  <th scope="col">Date</th>
                  <th scope="col">Price (pp)</th>
                  <th scope="col">Profit (pp)</th>
                  <th scope="col">Earnings</th>
                </tr>
              </thead>
              <tbody>
                <?php
                // selecting all the sold items of this seller
                $id = escape($_SESSION['ws_id']);
                $query = "SELECT * FROM items_sold INNER JOIN items ON ";
                $query .= "items_sold.fk_item_id=items.item_id INNER JOIN item_tracking ";
                $query .= "ON items.fk_item_tracking_id=item_tracking.item_tracking_id WHERE ";
                $query .= "fk_ws_id='$id' AND item_status='approved'";

                $result = mysqli_query($conn, $query);
                if (mysqli_num_rows($result) == 0) {
                  // code to show if the table is empty
                ?>
                  <tr>
                    <td colspan="8">
                      <div class="row text-center">
                        <div class="col-md-6 offset-md-3 col-8 offset-2">
                          <div class="alert alert-success"><strong>
                              No items sold yet! Do not worry, we are here for you &#x1F4AA;
                            </strong></div>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <?php
                } else { // if there is sell record

                  // to fetch sell records of the sold items
                  $show_total = 0;
                  while ($row = mysqli_fetch_assoc($result)) {
                    $quantity = $row['sell_quantity']; // quantity
                    $price = $row['item_price']; // price
                    $total = $quantity * $price; // total amount for unsold quantity

                    $profit = $row['item_profit']; // profit per piece
                    $profit_rs = ($profit / 100) * $price; // profit in rupees per piece

                    $total_profit_rs = $profit_rs * $quantity; // total profit on items sold
                    $total += $total_profit_rs; // total payment

                  ?>
                    <tr>
                      <td><?php echo $row['item_brand']; ?></td>
                      <td><?php echo $row['item_category']; ?></td>
                      <td><?php echo $row['item_number']; ?></td>
                      <td><?php echo $row['sell_quantity']; ?></td>
                      <td><?php echo $row['sell_date']; ?></td>
                      <td>Rs.<?php echo $row['item_price']; ?></td>
                      <td>Rs.<?php echo $profit_rs; ?> (<?php echo $row['item_profit']; ?>%)</td>
                      <td>Rs.<?php echo $total; ?></td>
                    </tr>

                  <?php
                    // total earnings of the seller
                    $show_total += $total;
                    // end of loop to show listed items
                  }
                  ?>
                  <!-- total payable to the seller -->
                  <tr>
                    <td colspan="7"><strong>Total</strong></td>
                    <td>Rs.<?php echo $show_total; ?></td>
                  </tr>
                  <!-- end total payable to the seller -->
                <?php
                  // end of else statement{if there is the reocord}
                }
                ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- end section to view sold items -->

<!-- Section for supplire/wholesaler to view rejected items -->
<section>

  <div class="padding-ws-index">
    <div class="row">
      <div class="col-auto">
        <div id="h3-ws-index">
          <h3 class="anton-regular">Rejected Items</h3>
        </div>
      </div>
    </div>
  </div>

  <div class="padding-ws-index">
    <div class="row">
      <div class="container-fluid">
        <div class="col-auto">
          <div class="table-responsive">
            <table class="table table-info table-hover table-bordered border-info">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">Brand</th>
                  <th scope="col">Category</th>
                  <th scope="col">Item Number</th>
                  <th scope="col">Rejection Reason</th>
                </tr>
              </thead>
              <tbody>
                <?php
                // selecting all the rejected items of this seller
                $id = escape($_SESSION['ws_id']);
                $query = "SELECT * FROM items INNER JOIN item_rejection ON ";
                $query .= "items.item_id=item_rejection.fk_item_id INNER JOIN item_tracking ";
                $query .= "ON items.fk_item_tracking_id=item_tracking.item_tracking_id WHERE ";
                $query .= "fk_ws_id='$id' AND item_status='rejected'";

                $result = mysqli_query($conn, $query);
                if (mysqli_num_rows($result) == 0) {
                  // code to show if the table is empty
                ?>
                  <tr>
                    <td colspan="8">
                      <div class="row text-center">
                        <div class="col-md-6 offset-md-3 col-8 offset-2">
                          <div class="alert alert-success"><strong>
                              Great! you are on a roll, no rejections &#x1F920;
                            </strong></div>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <?php
                } else { // if there is sell record

                  // to fetch sell records of the rejected items
                  while ($row = mysqli_fetch_assoc($result)) {
                  ?>
                    <tr>
                      <td><?php echo $row['item_brand']; ?></td>
                      <td><?php echo $row['item_category']; ?></td>
                      <td><?php echo $row['item_number']; ?></td>
                      <td><?php echo $row['rejection_reason']; ?></td>

                    <?php
                    // end of loop to show listed items
                  }
                    ?>
                  <?php
                  // end of else statement{if there is the reocord}
                }
                  ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- end section to view rejected items -->

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