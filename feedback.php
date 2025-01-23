<?php include('config\constants.php') ?>
<link rel="stylesheet" href="css/style.css">


<?php
// Check if the form is submitted
if (isset($_POST['sb'])) {
    // Check if 'rev' index exists in $_POST array
    if (isset($_POST['rev'])) {
        $rev = $_POST['rev'];
    } else {
        $rev = ''; // or any default value you want
    }

    $des = $_POST['desc'];

    // Insert feedback into database
    $query = "INSERT INTO tbl_feedback (id, TextFeedback) VALUES ('$rev', '$des')";
    $result = mysqli_query($conn, $query);

    if ($result) {
        echo "<h2 style='color: tomato; text-align: center;'>Data Added Successfully</h2>";
    } else {
        echo "<h2 style='color: tomato; text-align: center;'>Error: " . mysqli_error($conn) . "</h2>";
    }
}
?>


<!-- Start All Pages -->
<div class="all-page-title page-breadcrumb">
    <div class="container text-center">
        <div class="row">
            <div class="col-lg-12">
                <h1>Give Feedback</h1>
            </div>
        </div>
    </div>
</div>
<!-- End All Pages -->

<!-- Start Contact -->
<div class="contact-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title text-center">
                    <p>Our Main Goal is Client Satisfaction</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <form action="" method="post">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <textarea class="form-control" id="message" placeholder="Your Message" rows="4" name="desc" data-error="Write your message" required></textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="submit-button text-center">
                                <button name="sb" class="btn btn-common" id="submit" type="submit">Send Message</button>
                                <div id="msgSubmit" class="h3 text-center hidden"></div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="button-container text-center mt-3">
                    <a href="index.php" class="btn btn-primary ">Back to Home</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Contact -->