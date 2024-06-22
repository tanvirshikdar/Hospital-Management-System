<?php
$host = 'localhost';
$db = 'hospital_management_system';
$user = 'root';
$pass = '';
$entity = $_GET['entity'] ?? 'doctors';
$id = $_GET['id'] ?? null;
$data = [];
$columns = [];
$primaryKey = '';

try {
    // Establish database connection
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Fetch the primary key column name
    $stmt = $pdo->query("SHOW KEYS FROM $entity WHERE Key_name = 'PRIMARY'");
    $primaryKey = $stmt->fetch(PDO::FETCH_ASSOC)['Column_name'];

    // Fetch column names from the database table
    $stmt = $pdo->query("DESCRIBE $entity");
    $columns = $stmt->fetchAll(PDO::FETCH_COLUMN);

    // If an ID is provided, fetch the existing data for that record
    if ($id) {
        $stmt = $pdo->prepare("SELECT * FROM $entity WHERE $primaryKey = ?");
        $stmt->execute([$id]);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!$data) {
            echo "No data found for ID $id";
        }
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

function getInputValue($column, $data) {
    return htmlspecialchars($data[$column] ?? '');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $id ? 'Edit' : 'Add' ?> <?= htmlspecialchars(ucfirst($entity)) ?></title>
</head>
<body>
    <h1><?= $id ? 'Edit' : 'Add' ?> <?= htmlspecialchars(ucfirst($entity)) ?></h1>
    <form action="manage.php?entity=<?= htmlspecialchars($entity) ?>" method="post">
        <?php if ($id): ?>
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="data[<?= htmlspecialchars($primaryKey) ?>]" value="<?= htmlspecialchars($id) ?>">
        <?php else: ?>
            <input type="hidden" name="action" value="create">
        <?php endif; ?>
        
        <?php foreach ($columns as $column): ?>
            <?php if ($column != $primaryKey): // Skip the primary key field ?>
                <div>
                    <label for="<?= htmlspecialchars($column) ?>"><?= htmlspecialchars(ucfirst(str_replace('_', ' ', $column))) ?></label>
                    <input type="text" id="<?= htmlspecialchars($column) ?>" name="data[<?= htmlspecialchars($column) ?>]" value="<?= getInputValue($column, $data) ?>">
                </div>
            <?php endif; ?>
        <?php endforeach; ?>

        <button type="submit"><?= $id ? 'Update' : 'Create' ?> <?= htmlspecialchars(ucfirst($entity)) ?></button>
    </form>
</body>
</html>
