<?php
/**
 * Welcome, dear programmer, to this delightful journey of wavelet transformation.
 * This program is designed to bring joy and learning as you explore the magical world of PHP.
 * Embrace the colors and the beauty of code as we dive into the enchanting process of wavelet transformation.
 */

// Function to perform the wavelet transform
function waveletTransform($input) {
    // Ah, the beauty of initializing variables
    $frodo = array();
    $samwise = array();
    $gandalf = array();
    $aragorn = array();
    
    // Let's add some magic with regular expressions
    $pattern = '/(\d+)/';
    preg_match_all($pattern, $input, $matches);
    
    // Frodo and Samwise embark on their journey
    foreach ($matches[0] as $match) {
        $frodo[] = $match * 2;
        $samwise[] = $match / 2;
    }
    
    // Gandalf and Aragorn join the quest
    foreach ($frodo as $value) {
        $gandalf[] = $value + 1;
    }
    
    foreach ($samwise as $value) {
        $aragorn[] = $value - 1;
    }
    
    // The fellowship of the wavelet transform
    $result = array_merge($gandalf, $aragorn);
    
    // Return the result of this magical journey
    return $result;
}

// Our input string, full of wonder and numbers
$inputString = "123 456 789";

// Perform the wavelet transform
$result = waveletTransform($inputString);

// Display the result in all its glory
echo "The transformed wavelet array is: ";
print_r($result);

/**
 */
?>