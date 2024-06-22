<?php
session_start();
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: login.html");
    exit();
}

$host = 'localhost';
$db = 'hospital_management_system';
$user = 'root';
$pass = '';
$entity = $_GET['entity'] ?? 'doctors';

try {
    // Establish database connection
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Initialize columns and results
    $columns = [];
    $results = [];

    // Validate the entity name to prevent SQL injection
    if (!preg_match('/^[a-zA-Z_]+$/', $entity)) {
        throw new Exception('Invalid entity name.');
    }

    // Fetch the primary key column name
    $stmt = $pdo->query("SHOW KEYS FROM `$entity` WHERE Key_name = 'PRIMARY'");
    $primaryKey = $stmt->fetch(PDO::FETCH_ASSOC)['Column_name'];

    // Handle POST requests for create, update, and delete actions
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $action = $_POST['action'];
        $data = $_POST['data'] ?? [];

        if (!empty($data)) {
            switch ($action) {
                case 'create':
                    unset($data[$primaryKey]); // Ensure primary key is not set manually
                    $columns = implode(", ", array_keys($data));
                    $values = implode(", ", array_map([$pdo, 'quote'], array_values($data)));
                    $pdo->exec("INSERT INTO `$entity` ($columns) VALUES ($values)");
                    break;
                case 'update':
                    $id = $data[$primaryKey];
                    unset($data[$primaryKey]);
                    $set = implode(", ", array_map(fn($k, $v) => "$k = " . $pdo->quote($v), array_keys($data), array_values($data)));
                    $pdo->exec("UPDATE `$entity` SET $set WHERE `$primaryKey` = " . $pdo->quote($id));
                    break;
                case 'delete':
                    $id = $data[$primaryKey];
                    $pdo->exec("DELETE FROM `$entity` WHERE `$primaryKey` = " . $pdo->quote($id));
                    break;
            }
        }
    }

    // Fetch data from the database
    $stmt = $pdo->query("SELECT * FROM `$entity`");
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Initialize columns if results are available
    if ($results) {
        $columns = array_keys($results[0]);
    }
} catch (PDOException $e) {
    echo "Database Error: " . $e->getMessage();
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage <?= htmlspecialchars(ucfirst($entity)) ?></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Manage <?= htmlspecialchars(ucfirst($entity)) ?></h1>
        <a href="form.php?entity=<?= htmlspecialchars($entity) ?>" class="btn btn-primary">Add New <?= htmlspecialchars(ucfirst($entity)) ?></a>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <?php if ($columns): ?>
                        <?php foreach ($columns as $column): ?>
                            <th><?= htmlspecialchars(ucfirst($column)) ?></th>
                        <?php endforeach; ?>
                        <th>Actions</th>
                    <?php endif; ?>
                </tr>
            </thead>
            <tbody>
                <?php if ($results): ?>
                    <?php foreach ($results as $row): ?>
                        <tr>
                            <?php foreach ($row as $value): ?>
                                <td><?= htmlspecialchars($value) ?></td>
                            <?php endforeach; ?>
                            <td>
                                <a href="form.php?entity=<?= htmlspecialchars($entity) ?>&id=<?= htmlspecialchars($row[$primaryKey]) ?>" class="btn btn-sm btn-warning">Edit</a>
                                <form action="manage.php?entity=<?= htmlspecialchars($entity) ?>" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="data[<?= htmlspecialchars($primaryKey) ?>]" value="<?= htmlspecialchars($row[$primaryKey]) ?>">
                                    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this item?');">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="<?= count($columns) + 1 ?>">No records found.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</body>
</html>
