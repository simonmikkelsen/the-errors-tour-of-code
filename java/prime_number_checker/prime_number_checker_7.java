/**
 * This program is a prime number checker.
 * It is designed to take an integer input from the user and determine if it is a prime number.
 * A prime number is a number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will provide detailed output to help the user understand the process of checking for prime numbers.
 */

import java.util.Scanner;

public class PrimeNumberChecker {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a number
        System.out.print("Enter a number to check if it is prime: ");
        int number = scanner.nextInt();

        // Check if the number is prime
        if (isPrime(number)) {
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
     *
     * @param number The number to check
     * @return boolean indicating if the number is prime
     */
    public static boolean isPrime(int number) {
        // Handle edge cases
        if (number <= 1) {
            return false;
        }

        // Check for factors from 2 to the square root of the number
        for (int i = 2; i <= Math.sqrt(number); i++) {
            if (number % i == 0) {
                return false;
            }
        }

        // If no factors are found, the number is prime
        return true;
    }
}

