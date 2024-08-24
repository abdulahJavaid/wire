<?php // requiring the header of page
require_once("includes/header.php");
?>

<?php
// adding data for the entered item
if (isset($_POST['add'])) {
    $category = $_POST['item_category'];
    $brand = $_POST['item_brand'];
    $price = $_POST['item_price'];
    $quantity = $_POST['item_quantity'];
    $description = $_POST['item_description'];

    $tmp = $_FILES['item_image']['tmp_name'];
    $image = $_FILES['item_image']['name'];
    move_uploaded_file($tmp, __DIR__ . "/uploads/item-images/" . $image);

    $query = "SELECT item_id FROM items ORDER BY item_id DESC LIMIT 1";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) != 0) {
        $row = mysqli_fetch_assoc($result);
        $rplc = $row['item_id'];
        $rplc += 1;
        $rplc = (string) $rplc;
    } else {
        $rplc = '1';
    }
    rename("./uploads/item-images/" . $image ."", "./uploads/item-images/" . $rplc . $image ."" );

    $img = $rplc . $image;
    // additional logic needed for proper working
    // $query = "SELECT * FROM item_tracking WHERE item";

    $query = "INSERT INTO items(item_category, item_brand, item_image, item_description, item_quantity, ";
    $query .= " item_price, item_sold, fk_item_tracking_id) VALUES('$category', '$brand', '$img', '$description', ";
    $query .= "'$quantity', '$price', '0', '1')";

    $result = mysqli_query($conn, $query);
}

?>

<!-- Section for supplire/wholesaler to list new items -->
<section>

    <div class="padding-ws-index">
        <div class="row">
            <div class="col-auto">
                <div id="h2-ws-index">
                    <h2 class="anton-regular">List a Product</h2>
                </div>
            </div>
        </div>
    </div>

    <div class="padding-ws-index">
    <div class="col-auto offset-md-1">
        <div class="row justify-content-start">
            <div class="card border-dark mb-3" style="background-color: white; max-width: 600px; width: 100%;">
                <div class="card-header text-white" style="background-color: #343a40; color: white;"><strong>Add Details</strong></div>
                <div class="card-body text-dark">
                    <form action="" method="post" enctype="multipart/form-data">
                        <div class="row mb-3">
                        <label for="item_category" class="form-label"><u>Warehouse</u></label>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="item_category" class="form-label"><u>Category</u></label>
                                <select name="item_category" class="form-select form-select-lg" required>
                                    <option value="">Select category</option>
                                    <?php
                                    // select all categories from the database
                                    $query = "SELECT * FROM category";
                                    $result = mysqli_query($conn, $query);
                                    while ($row = mysqli_fetch_assoc($result)) {
                                    ?>
                                        <option value="<?php echo $row['category_name']; ?>"><?php echo $row['category_name']; ?></option>
                                    <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="item_brand" class="form-label"><u>Brand</u></label>
                                <select name="item_brand" class="form-select form-select-lg" required>
                                    <option value="">Select Brand</option>
                                    <?php
                                    // select all categories from the database
                                    $query = "SELECT * FROM brand";
                                    $result = mysqli_query($conn, $query);
                                    while ($row = mysqli_fetch_assoc($result)) {
                                    ?>
                                        <option value="<?php echo $row['brand_name']; ?>"><?php echo $row['brand_name']; ?></option>
                                    <?php
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>

                        <!-- File Input Section with Image Placeholder -->
                        <!-- <div class="mb-3">
                            <label for="item_image" class="form-label"><u>Image</u></label>
                            <div class="text-center">
                                <img id="imagePreview" src="https://via.placeholder.com/100" alt="Image Preview" class="rounded mb-2" style="max-width: 100px;">
                            </div>
                            <div class="input-group justify-content-center">
                                <input type="file" name="item_image" class="form-control d-none" id="fileInput" required onchange="previewImage(event)">
                                <button class="btn btn-secondary" type="button" id="uploadButton">
                                    <i class="bi bi-upload"></i>
                                </button>&nbsp;
                                <button class="btn btn-danger" type="button" id="deleteButton">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </div>
                        </div> -->
                        <!-- <div class="mb-3">
                            <label for="item_image" class="form-label"><u>Image</u></label>
                            <div class="input-group align-items-center">
                                <input type="file" name="item_image" class="form-control d-none" id="fileInput" required onchange="previewImage(event)">
                                <button class="btn btn-secondary" type="button" id="uploadButton">
                                    <i class="bi bi-upload"></i>
                                </button>&nbsp;
                                <button class="btn btn-danger" type="button" id="deleteButton">
                                    <i class="bi bi-trash"></i>
                                </button>&nbsp;
                                <img id="imagePreview" src="https://via.placeholder.com/100" alt="Image Preview" class="rounded ms-2" style="max-width: 100px;">
                            </div>
                        </div> -->
                        <div class="mb-3">
                            <label for="item_image" class="form-label"><u>Image</u></label>
                            <div class="input-group">
                                <input type="file" name="item_image" class="form-control d-none" id="fileInput" required onchange="previewImage(event)">
                                <button class="btn btn-secondary" type="button" id="uploadButton">
                                    <i class="bi bi-upload"></i>
                                </button>&nbsp;
                                <button class="btn btn-danger" type="button" id="deleteButton">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </div>
                            <div class="mt-3 text-center">
                                <img id="imagePreview" src="https://via.placeholder.com/100" alt="Image Preview" class="rounded" style="max-width: 150px;">
                            </div>
                        </div> 

                        <div class="mb-3">
                            <label for="item_price" class="form-label"><u>Price</u></label>
                            <input type="text" name="item_price" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="item_quantity" class="form-label"><u>Quantity</u></label>
                            <input type="text" name="item_quantity" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="item_description" class="form-label"><u>Description</u></label>
                            <textarea name="item_description" class="form-control" id="" required></textarea>
                        </div>
                        <button type="submit" name="add" class="btn btn-sm btn-dark">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</section>

<?php // requiring the footer of page
require_once("includes/footer.php");
?>