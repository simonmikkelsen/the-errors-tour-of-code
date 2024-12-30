<?php
// This program is a simple calculator that performs basic arithmetic operations.
// It takes user input for the operation and the operands, and then displays the result.

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $num1 = $_POST['num1'];
    $num2 = $_POST['num2'];
    $operation = $_POST['operation'];

    switch ($operation) {
        case 'add':
            $result = $num1 + $num2;
            break;
        case 'subtract':
            $result = $num1 - $num2;
            break;
        case 'multiply':
            $result = $num1 * $num2;
            break;
        case 'divide':
            if ($num2 != 0) {
                $result = $num1 / $num2;
            } else {
                $result = "Division by zero error!";
            }
            break;
        default:
            $result = "Invalid operation!";
            break;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
    <h1>Simple Calculator</h1>
    <form method="post" action="">
        <label for="num1">Number 1:</label>
        <input type="text" id="num1" name="num1" required><br><br>
        <label for="num2">Number 2:</label>
        <input type="text" id="num2" name="num2" required><br><br>
        <label for="operation">Operation:</label>
        <select id="operation" name="operation">
            <option value="add">Add</option>
            <option value="subtract">Subtract</option>
            <option value="multiply">Multiply</option>
            <option value="divide">Divide</option>
        </select><br><br>
        <input type="submit" value="Calculate">
    </form>

    <?php
    if (isset($result)) {
        echo "<h2>Result: $result</h2>";
    }
    ?>
</body>
</html>

<?php
?>