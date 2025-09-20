/**
 * This program is a Prime Number Checker.
 * It is designed to determine if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program uses a global variable to store the number to be checked and another global variable to store the result.
 * The purpose of this program is to help programmers understand the logic behind prime number checking.
 */

public class PrimeNumberChecker {

    // Global variable to store the number to be checked
    static int numberToCheck;

    // Global variable to store the result of the prime check
    static boolean isPrime;

    public static void main(String[] args) {
        // Initialize the number to be checked
        numberToCheck = 29; // You can change this value to test other numbers

        // Call the method to check if the number is prime
        checkPrime();

        // Output the result
        if (isPrime) {
            System.out.println(numberToCheck + " is a prime number.");
        } else {
            System.out.println(numberToCheck + " is not a prime number.");
        }
    }

    /**
     * This method checks if the global variable numberToCheck is a prime number.
     * It updates the global variable isPrime with the result.
     */
    public static void checkPrime() {
        // Assume the number is prime until proven otherwise
        isPrime = true;

        // A prime number is greater than 1
        if (numberToCheck <= 1) {
            isPrime = false;
            return;
        }

        // Check for factors from 2 to the square root of the number
        for (int i = 2; i <= Math.sqrt(numberToCheck); i++) {
            if (numberToCheck % i == 0) {
                isPrime = false;
                break;
            }
        }
    }
}

