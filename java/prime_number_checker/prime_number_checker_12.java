/**
 * This program is a prime number checker.
 * It is designed to determine if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and check if it is a prime number.
 * It will then output the result to the user.
 */

import java.util.Scanner;

public class PrimeNumberChecker {

    // Method to check if a number is prime
    public static boolean isPrime(int number) {
        // Check if number is less than 2
        if (number < 2) {
            return false;
        }
        // Check for factors from 2 to the square root of the number
        for (int i = 2; i <= Math.sqrt(number); i++) {
            if (number % i == 0) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a number
        System.out.println("Enter a number to check if it is prime:");
        int number = scanner.nextInt();

        // Cache the result of the prime check in memory
        boolean result = isPrime(number);

        // Output the result to the user
        if (result) {
            System.out.println(number + " is a prime number.");
        } else {
            System.out.println(number + " is not a prime number.");
        }

        // Close the scanner object
        scanner.close();
    }
}

