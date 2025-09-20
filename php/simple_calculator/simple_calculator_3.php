<?php
/**
 * Simple Calculator Program
 * This program performs basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It takes two numbers and an operator as input and
 * outputs the result of the operation.
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

$handle = fopen("php://stdin", "r");

echo "Enter first number: ";
$firstNumber = fgets($handle);

echo "Enter second number: ";
$secondNumber = fgets($handle);

echo "Enter operator (+, -, *, /): ";
$operator = trim(fgets($handle));

switch ($operator) {
    case '+':
        $result = add($firstNumber, $secondNumber);
        break;
    case '-':
        $result = subtract($firstNumber, $secondNumber);
        break;
    case '*':
        $result = multiply($firstNumber, $secondNumber);
        break;
    case '/':
        $result = divide($firstNumber, $secondNumber);
        break;
    default:
        $result = "Invalid operator!";
        break;
}

echo "Result: " . $result . "\n";

?>