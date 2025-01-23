<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Feedback</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css\adminlogin.css">
</head>
<body>
    <?php 
    // Define the path to constants.php file
    include "../config/constants.php";

    // Database Connection
    $conn = mysqli_connect(LOCALHOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
    ?>

    <div class="content">
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>COMMENTS</th>
                        <th>Action</th> <!-- New column for delete button -->
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    // Select feedback data from the database
                    $feedback_query = mysqli_query($conn, "SELECT * FROM tbl_feedback");
                    
                    // Check if there are rows returned from the query
                    if (mysqli_num_rows($feedback_query) > 0) {
                        // Loop through each feedback and display it in a table row
                        while ($row = mysqli_fetch_assoc($feedback_query)) {
                    ?>
                    <tr>
                        <td><?php echo $row['id']; ?></td>
                        <td><?php echo $row['TextFeedback']; ?></td>
                        <td>
                            <form method="post">
                                <input type="hidden" name="feedback_id" value="<?php echo $row['id']; ?>">
                                <button type="submit" name="delete_feedback" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <?php 
                        }
                    } else {
                        // If no feedback found, display a message
                        echo '<tr><td colspan="3">No comments found</td></tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
    <div class="button-container text-center mt-3">
        <a href="index.php" class="btn btn-primary ">Back to Home</a>
    </div>

    <?php
// Delete feedback logic
if(isset($_POST['delete_feedback'])) {
    $feedback_id = $_POST['feedback_id'];
    $delete_query = "DELETE FROM tbl_feedback WHERE id = $feedback_id";
    if(mysqli_query($conn, $delete_query)) {
        echo '<script>alert("Feedback deleted successfully.");</script>';
        // Reset auto-increment value after deletion
        $reset_auto_increment_query = "ALTER TABLE tbl_feedback AUTO_INCREMENT = 1";
        mysqli_query($conn, $reset_auto_increment_query);
        echo '<script>window.location.href="view-feedback.php";</script>';
    } else {
        echo '<script>alert("Failed to delete feedback.");</script>';
    }
}
?>


</body>
</html>
