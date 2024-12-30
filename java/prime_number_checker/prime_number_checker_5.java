/**
 * This program is a Prime Number Checker.
 * It is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It uses a simple algorithm to check for prime numbers by testing divisibility.
 */

import java.util.Scanner;

public class PrimeNumberChecker {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a number
        System.out.print("Enter a number to check if it is prime: ");
        int number = scanner.nextInt();

        // Call the isPrime method to check if the number is prime
        boolean result = isPrime(number);

        // Print the result
        if (result) {
            System.out.println(number + " is a prime number.");
        } else {
            System.out.println(number + " is not a prime number.");
        }

        // Close the scanner
        scanner.close();
    }

    /**
     * This method checks if a given number is prime.
     * It returns true if the number is prime, and false otherwise.
     * The method uses a loop to test divisibility from 2 up to the square root of the number.
     * If the number is divisible by any number in this range, it is not prime.
     *
     * @param num The number to check for primality
     * @return true if the number is prime, false otherwise
     */
    public static boolean isPrime(int num) {
        // Check if the number is less than 2
        if (num < 2) {
            return false;
        }

        // Loop from 2 to the square root of the number
        for (int i = 2; i <= Math.sqrt(num); i++) {
            // Check if the number is divisible by i
            if (num % i == 0) {
                return false;
            }
        }

        // If no divisors were found, the number is prime
        return true;
    }
}

