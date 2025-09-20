<?php
/**
 * This program is a factorial calculator written in PHP.
 * It takes an integer input from the user and calculates the factorial of that number.
 * The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * This program is designed to help programmers understand the process of calculating factorials.
 */

// Function to calculate the factorial of a given number
function factorial($num) {
    // Initialize the result to 1
    $result = 1;

    // Loop from 1 to the given number
    for ($i = 1; $i <= $num; $i++) {
        // Multiply the result by the current number
        $result *= $i;
    }

    // Return the calculated factorial
    return $result;
}

// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the input number from the form
    $number = intval($_POST["number"]);

    // Calculate the factorial of the input number
    $factorialResult = factorial($number);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Factorial Calculator</title>
</head>
<body>
    <h1>Factorial Calculator</h1>
    <form method="post" action="">
        <label for="number">Enter a number:</label>
        <input type="text" id="number" name="number" required>
        <input type="submit" value="Calculate">
    </form>

    <?php
    // Display the result if the form has been submitted
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        echo "<h2>Factorial of " . $number . " is: " . $factorialResult . "</h2>";
    }
    ?>
</body>
</html>

<?php
?>