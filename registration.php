<?php
// Establish database connection
$servername = "localhost";
$dbname = "hospital_management_system";
$username = "root"; // Default username for XAMPP
$password = ""; // Default password for XAMPP

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve form data
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];
$fullname = $_POST['fullname'];
$birthdate = $_POST['birthdate'];
$gender = $_POST['gender'];

// Hash the password
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

// Create SQL query to insert the user data into the table
$stmt = $conn->prepare("INSERT INTO users (username, password, email, fullname, birthdate, gender) VALUES (?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssssss", $username, $hashedPassword, $email, $fullname, $birthdate, $gender);

if ($stmt->execute()) {
    // Registration successful, display success message
    echo "Registration successful! Please proceed to <a href='login.html'>Login</a>.";

    // Redirect to login page after a delay
    header("refresh:5;url=login.html");
    exit();
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close(); // Close prepared statement
$conn->close(); // Close database connection
?>