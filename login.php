<?php
session_start();
include 'database_connection.php'; // Ensure you have this file to connect to the database

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Query to check if the user exists
    $query = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) == 1) {
        $_SESSION['loggedin'] = true;
        $_SESSION['username'] = $username;
        echo 'success';
    } else {
        echo 'Invalid username or password';
    }
}
?>
