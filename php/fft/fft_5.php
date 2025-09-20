<?php
/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is a beautiful symphony of mathematical elegance and computational efficiency.
 * The FFT is a powerful tool used in signal processing, image analysis, and many other fields.
 * Let's embark on this enchanting journey together!
 */

// Function to perform the FFT
function fft($arr) {
    $n = count($arr);
    if ($n <= 1) {
        return $arr;
    }

    // Splitting the array into even and odd indexed elements
    $even = array();
    $odd = array();
    for ($i = 0; $i < $n; $i++) {
        if ($i % 2 == 0) {
            $even[] = $arr[$i];
        } else {
            $odd[] = $arr[$i];
        }
    }

    // Recursively perform FFT on the even and odd parts
    $even = fft($even);
    $odd = fft($odd);

    // Combine the results
    $result = array();
    for ($k = 0; $k < $n / 2; $k++) {
        $t = exp(-2 * M_PI * $k / $n) * $odd[$k];
        $result[$k] = $even[$k] + $t;
        $result[$k + $n / 2] = $even[$k] - $t;
    }

    return $result;
}

// Function to create a complex number
function complex($real, $imag) {
    return array($real, $imag);
}

// Function to print a complex number
function printComplex($c) {
    echo $c[0] . " + " . $c[1] . "i\n";
}

// Main function to demonstrate the FFT
function main() {
    // Creating a lovely array of complex numbers
    $arr = array(
        complex(0, 0),
        complex(1, 0),
        complex(0, 1),
        complex(1, 1)
    );

    // Performing the FFT
    $result = fft($arr);

    // Printing the results
    foreach ($result as $c) {
        printComplex($c);
    }
}

// Calling the main function to start the magic
main();

/***
***/
?>