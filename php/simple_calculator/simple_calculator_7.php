<?php
/**
 * Simple Calculator Program
 * This program performs basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It is designed to help programmers practice and
 * improve their debugging skills by identifying and fixing errors.
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
        throw new Exception("Division by zero error.");
    }
    return $a / $b;
}

$operation = 'add';
$a = 10;
$b = 5;

switch ($operation) {
    case 'add':
        echo add($a, $b);
        break;
    case 'subtract':
        echo subtract($a, $b);
        break;
    case 'multiply':
        echo multiply($a, $b);
        break;
    case 'divide':
        echo divide($a, $b);
        break;
    default:
        echo "Invalid operation.";
        break;
}

