<?php
include('partials-front/menu.php');

// Check whether category_id is set in the URL
if (isset($_GET['category_id'])) {
  // Category id is set, get the id
  $category_id = $_GET['category_id'];

  // Get the category title based on category ID
  $sql_category = "SELECT title FROM tbl_category WHERE id=$category_id";

  // Execute the query
  $res_category = mysqli_query($conn, $sql_category);

  // Fetch the category title from the result
  $row_category = mysqli_fetch_assoc($res_category);

  // Get the title
  $category_title = $row_category['title'];
} else {
  // If category_id is not set in the URL, redirect to the home page
  header('location:' . SITEURL);
}

// Retrieve category description
$sql_description = "SELECT description FROM tbl_category WHERE id=$category_id";
$res_description = mysqli_query($conn, $sql_description);
$row_description = mysqli_fetch_assoc($res_description);
$category_description = isset($row_description['description']) ? $row_description['description'] : '';

?>

<section class="food-search-category text-center">
  <div class="container-video">
    
    <video class="food-search-video" autoplay muted loop>
      <source src="/food-order/images/video/last.mp4" type="video/mp4">
      <p>Your browser does not support the video tag.</p>
    </video>
  </div>
</section>
<div class="container">
<h2>Foods on <a href="#" class="text-darkblue">"<?php echo $category_title; ?>"</a></h2>
</div>

<section class="category-description">
  <div class="container">
    <h2>Restaurant Description</h2>
    <h3><?php echo $category_description; ?></h3>
  </div>
</section>

<section class="food-menu">
  <div class="container">
    <h2 class="text-center">Food Menu</h2>

    <?php
    // Create SQL query to get foods based on selected category
    $sql_foods = "SELECT * FROM tbl_food WHERE category_id=$category_id";

    // Execute the query
    $res_foods = mysqli_query($conn, $sql_foods);

    // Check whether there are foods available
    if (mysqli_num_rows($res_foods) > 0) {
      // Foods available, fetch and display them
      while ($row_food = mysqli_fetch_assoc($res_foods)) {
        $food_id = $row_food['id'];
        $food_title = $row_food['title'];
        $food_price = $row_food['price'];
        $food_description = $row_food['description'];
        $food_image = $row_food['image_name'];
        ?>

        <div class="food-menu-box">
          <div class="food-menu-img">
            <?php if (!empty($food_image)) { ?>
              <img src="<?php echo SITEURL; ?>images/food/<?php echo $food_image; ?>" alt="<?php echo $food_title; ?>" class="img-responsive img-curve">
            <?php } else { ?>
              <div class="error">Image not Available.</div>
            <?php } ?>
          </div>
          <div class="food-menu-desc">
            <h4><?php echo $food_title; ?></h4>
            <p class="food-price">$<?php echo $food_price; ?></p>
            <p class="food-detail"><?php echo $food_description; ?></p>
            <br>
            <a href="<?php echo SITEURL; ?>order.php?food_id=<?php echo $food_id; ?>" class="btn btn-primary">Order Now</a>
          </div>
        </div>

      <?php
      }
    } else {
      // No foods available for this category
      echo "<div class='error'>No Foods Available.</div>";
    }
    ?>

    <div class="clearfix"></div>
  </div>
</section>

<?php include('partials-front/footer.php'); ?>
