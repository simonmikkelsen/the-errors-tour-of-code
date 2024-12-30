<?php
/**
 * Simple Calculator Program
 * This program performs basic arithmetic operations: addition, subtraction, multiplication, and division.
 * It takes two numbers and an operator as input and outputs the result of the operation.
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

$number1 = 10;
$number2 = 5;
$operator = '/';

switch ($operator) {
    case '+':
        $result = add($number1, $number2);
        break;
    case '-':
        $result = subtract($number1, $number2);
        break;
    case '*':
        $result = multiply($number1, $number2);
        break;
    case '/':
        $result = divide($number1, $number2);
        break;
    default:
        $result = "Invalid operator!";
        break;
}

echo "The result is: " . $result;
?>
