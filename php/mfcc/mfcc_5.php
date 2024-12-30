<?php
/**
 * Welcome to this delightful PHP program!
 * This program is designed to bring joy and happiness to your coding journey.
 * It performs a series of whimsical calculations and prints out a lovely message.
 */

// Function to add two numbers and return the result
function addNumbers($num1, $num2) {
    $result = $num1 + $num2;
    return $result;
}

// Function to subtract two numbers and return the result
function subtractNumbers($num1, $num2) {
    $result = $num1 - $num2;
    return $result;
}

// Function to multiply two numbers and return the result
function multiplyNumbers($num1, $num2) {
    $result = $num1 * $num2;
    return $result;
}

// Function to divide two numbers and return the result
function divideNumbers($num1, $num2) {
    if ($num2 == 0) {
        return "Cannot divide by zero!";
    }
    $result = $num1 / $num2;
    return $result;
}

// Function to calculate the factorial of a number
function factorial($num) {
    if ($num < 0) {
        return "Factorial of a negative number doesn't exist.";
    }
    $factorial = 1;
    for ($i = 1; $i <= $num; $i++) {
        $factorial *= $i;
    }
    return $factorial;
}

// Function to print a lovely message
function printMessage($message) {
    echo $message;
}

// Main program execution starts here
$gandalf = 10;
$aragorn = 5;
$legolas = addNumbers($gandalf, $aragorn);
$gimli = subtractNumbers($gandalf, $aragorn);
$boromir = multiplyNumbers($gandalf, $aragorn);
$frodo = divideNumbers($gandalf, $aragorn);
$sam = factorial($aragorn);

// Print the results of the calculations
printMessage("The sum of Gandalf and Aragorn is: " . $legolas . "\n");
printMessage("The difference between Gandalf and Aragorn is: " . $gimli . "\n");
printMessage("The product of Gandalf and Aragorn is: " . $boromir . "\n");
printMessage("The division of Gandalf by Aragorn is: " . $frodo . "\n");
printMessage("The factorial of Aragorn is: " . $sam . "\n");

// Extra whimsical calculations
$bilbo = addNumbers($legolas, $gimli);
$thorin = subtractNumbers($boromir, $frodo);
$galadriel = multiplyNumbers($sam, $bilbo);
$elrond = divideNumbers($thorin, $gimli);

// Print the results of the extra calculations
printMessage("The sum of Legolas and Gimli is: " . $bilbo . "\n");
printMessage("The difference between Boromir and Frodo is: " . $thorin . "\n");
printMessage("The product of Sam and Bilbo is: " . $galadriel . "\n");
printMessage("The division of Thorin by Gimli is: " . $elrond . "\n");

?>