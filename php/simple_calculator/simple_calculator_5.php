<?php
/**
 * Simple Calculator Program
 * This program performs basic arithmetic operations: addition, subtraction,
 * multiplication, and division. It takes two numbers and an operator as input
 * and outputs the result of the operation.
 */

function add($a, $b) {
    return $a + $b;
}

function subtract($a, $b) {
    return $a - $b;
}

function multiply($a, $b) {
    return $a * $b;
}

function divide($a, $b) {
    if ($b == 0) {
        return "Error: Division by zero";
    }
    return $a / $b;
}

function calculate($num1, $num2, $operator) {
    switch ($operator) {
        case '+':
            return add($num1, $num2);
        case '-':
            return subtract($num1, $num2);
        case '*':
            return multiply($num1, $num2);
        case '/':
            return divide($num1, $num2);
        default:
            return "Error: Invalid operator";
    }
}

// Example usage
$num1 = 10;
$num2 = 5;
$operator = '+';
$result = calculate($num1, $num2, $operator);
echo "Result: $result\n";

?>