<?php
/**
 * Simple Calculator Program
 * This program performs basic arithmetic operations: addition, subtraction, multiplication, and division.
 * It takes two numbers and an operator as input and returns the result of the operation.
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
        return "Division by zero error!";
    }
    return $a / $b;
}

function calculate($a, $b, $operator) {
    switch ($operator) {
        case '+':
            return add($a, $b);
        case '-':
            return subtract($a, $b);
        case '*':
            return multiply($a, $b);
        case '/':
            return divide($a, $b);
        default:
            return "Invalid operator!";
    }
}

$a = 10;
$b = 5;
$operator = '+';

$result = calculate($a, $b, $operator);
echo "Result: $result\n";

?>