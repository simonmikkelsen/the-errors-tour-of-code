/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an input number and determine if it is prime.
 * 
 * The purpose of this program is to help programmers understand how to implement a prime number checker in JavaScript.
 * It includes detailed comments to explain each part of the code.
 */

// Function to check if a number is prime
function isPrime(num) {
    // Check if the number is less than 2
    if (num < 2) {
        return false; // Numbers less than 2 are not prime
    }

    // Loop from 2 to the square root of the number
    for (let i = 2; i <= Math.sqrt(num); i++) {
        // Check if the number is divisible by i
        if (num % i === 0) {
            return false; // If divisible, the number is not prime
        }
    }

    // If no divisors were found, the number is prime
    return true;
}

// Function to get user input and check if it's a prime number
function checkPrime() {
    // Prompt the user to enter a number
    let input = prompt("Enter a number to check if it is prime:");

    // Convert the input to a number
    let number = parseInt(input);

    // Check if the input is a valid number
    if (isNaN(number)) {
        alert("Please enter a valid number."); // Alert the user if the input is not a number
        return;
    }

    // Check if the number is prime
    if (isPrime(number)) {
        alert(number + " is a prime number."); // Alert the user if the number is prime
    } else {
        alert(number + " is not a prime number."); // Alert the user if the number is not prime
    }
}

// Call the checkPrime function to start the program
checkPrime();

