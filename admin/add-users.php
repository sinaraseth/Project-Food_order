<?php include('partials/menu.php'); ?>

<div class="main-content">
    <div class="wrapper">
        <h1>Add User</h1>

        <br><br>

        <?php 
            if(isset($_SESSION['add'])) {
                echo $_SESSION['add'];
                unset($_SESSION['add']);
            }
        ?>

        <form action="" method="POST">

            <table class="tbl-30">
                <tr>
                    <td>Username: </td>
                    <td>
                        <input type="text" name="username" placeholder="Username">
                    </td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td>
                        <input type="password" name="password" placeholder="Password">
                    </td>
                </tr>
                <tr>
                    <td>Full Name: </td>
                    <td>
                        <input type="text" name="full_name" placeholder="Full Name">
                    </td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td>
                        <input type="text" name="email" placeholder="Email">
                    </td>
                </tr>
                <tr>
                    <td>Contact: </td>
                    <td>
                        <input type="text" name="contact" placeholder="Contact">
                    </td>
                </tr>
                <tr>
                    <td>Address: </td>
                    <td>
                        <input type="text" name="address" placeholder="Address">
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input type="submit" name="submit" value="Add User" class="btn-secondary">
                    </td>
                </tr>

            </table>

        </form>


    </div>
</div>

<?php include('partials/footer.php'); ?>

<?php 
    // Process the form data and save it in the database

    if(isset($_POST['submit'])) {
        // Retrieve form data
        $username = mysqli_real_escape_string($conn, $_POST['username']);
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $full_name = mysqli_real_escape_string($conn, $_POST['full_name']);
        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $contact = mysqli_real_escape_string($conn, $_POST['contact']);
        $address = mysqli_real_escape_string($conn, $_POST['address']);

        // SQL query to save data into the database
        $sql = "INSERT INTO users (username, password, full_name, email, contact, address, created_at) 
                VALUES ('$username', '$password', '$full_name', '$email', '$contact', '$address', current_timestamp())";

        // Execute query and handle result
        $res = mysqli_query($conn, $sql);
        if($res) {
            $_SESSION['add'] = "<div class='success'>User added successfully.</div>";
            header("location:".SITEURL.'admin/manage-users.php');
        } else {
            $_SESSION['add'] = "<div class='error'>Failed to add user.</div>";
            header("location:".SITEURL.'admin/add-users.php');
        }
    }
?>
