<?php
/**
 * Simple Calculator Program
 * This program performs basic arithmetic operations: addition, subtraction, multiplication, and division.
 * It takes two numbers and an operator as input and outputs the result.
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
$operator = '+';

while (true) {
    switch ($operator) {
        case '+':
            echo add($number1, $number2);
            break;
        case '-':
            echo subtract($number1, $number2);
            break;
        case '*':
            echo multiply($number1, $number2);
            break;
        case '/':
            echo divide($number1, $number2);
            break;
        default:
            echo "Invalid operator!";
            break;
    }
    break;
}

?>