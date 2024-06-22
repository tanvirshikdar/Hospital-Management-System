<?php
session_start();
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: login.html");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="header">Hospital Management System</h1>
        <a href="logout.php" class="btn btn-danger">Logout</a>
        <ul class="list-group mt-3">
            <li class="list-group-item"><a href="manage.php?entity=doctors">Doctors</a></li>
            <li class="list-group-item"><a href="manage.php?entity=departments">Departments</a></li>
            <li class="list-group-item"><a href="manage.php?entity=wards">Wards</a></li>
            <li class="list-group-item"><a href="manage.php?entity=rooms">Rooms</a></li>
            <li class="list-group-item"><a href="manage.php?entity=beds">Beds</a></li>
            <li class="list-group-item"><a href="manage.php?entity=patients">Patients</a></li>
            <li class="list-group-item"><a href="manage.php?entity=admissions">Admissions</a></li>
            <li class="list-group-item"><a href="manage.php?entity=payments">Payments</a></li>
            <li class="list-group-item"><a href="manage.php?entity=installments">Installments</a></li>
            <li class="list-group-item"><a href="manage.php?entity=tests">Tests</a></li>
            <li class="list-group-item"><a href="manage.php?entity=medications">Medications</a></li>
            <li class="list-group-item"><a href="manage.php?entity=prescriptions">Prescriptions</a></li>
            <li class="list-group-item"><a href="manage.php?entity=billing">Billing</a></li>
            <li class="list-group-item"><a href="manage.php?entity=appointments">Appointments</a></li>
        </ul>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
