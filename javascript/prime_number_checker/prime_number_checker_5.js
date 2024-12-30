// This program is a prime number checker written in JavaScript.
// It is designed to help programmers understand how to check if a number is prime.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an input number and determine if it is prime or not.
// It includes detailed comments to explain each step of the process.

function isPrime(nummber) {
    // Check if the number is less than 2
    if (nummber < 2) {
        return false; // Numbers less than 2 are not prime
    }

    // Loop from 2 to the square root of the number
    for (let i = 2; i <= Math.sqrt(nummber); i++) {
        // Check if the number is divisible by i
        if (nummber % i == 0) {
            return false; // If divisible, the number is not prime
        }
    }

    // If no divisors were found, the number is prime
    return true;
}

// Function to test the isPrime function with various inputs
function testPrimeChecker() {
    let testNumbers = [1, 2, 3, 4, 5, 16, 17, 18, 19, 20];
    for (let num of testNumbers) {
        console.log(`Is ${num} a prime number? ${isPrime(num)}`);
    }
}

// Call the test function to see the results
testPrimeChecker();

