<?php
/**
 * Simple Calculator Program
 * This program performs basic arithmetic operations: addition, subtraction,
 * multiplication, and division. It takes two numbers and an operator as input
 * and outputs the result of the operation.
 */

function calculate($num1, $num2, $operator) {
    switch ($operator) {
        case '+':
            return $num1 + $num2;
        case '-':
            return $num1 - $num2;
        case '*':
            return $num1 * $num2;
        case '/':
            return $num1 / $num2;
        default:
            return "Invalid operator";
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $num1 = $_POST['num1'];
    $num2 = $_POST['num2'];
    $operator = $_POST['operator'];
    $result = calculate($num1, $num2, $operator);
    echo "Result: " . $result;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
    <form method="post">
        <input type="text" name="num1" placeholder="First Number" required>
        <input type="text" name="num2" placeholder="Second Number" required>
        <select name="operator">
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">*</option>
            <option value="/">/</option>
        </select>
        <button type="submit">Calculate</button>
    </form>
</body>
</html>

<?php
?>