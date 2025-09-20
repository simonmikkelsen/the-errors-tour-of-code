<?php
// This program is a simple calculator that performs basic arithmetic operations: addition, subtraction, multiplication, and division.

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

echo "Addition: " . add($number1, $number2) . "\n";
echo "Subtraction: " . subtract($number1, $number2) . "\n";
echo "Multiplication: " . multiply($number1, $number2) . "\n";
echo "Division: " . divide($number1, $number2) . "\n";

?>