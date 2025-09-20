/**
 * This program is a Prime Number Checker.
 * It is designed to determine whether a given number is a prime number or not.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then check if the number is prime.
 * It will provide detailed output to explain the steps taken to determine the primality of the number.
 */

import java.util.Scanner;

public class PrimeNumberChecker {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a number
        System.out.println("Enter a number to check if it is prime:");
        int number = scanner.nextInt();

        // Call the isPrime method to check if the number is prime
        boolean result = isPrime(number);

        // Output the result
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
     * It iterates from 2 to the square root of the number to check for divisors.
     * If any divisor is found, the number is not prime.
     * 
     * @param num The number to check for primality
     * @return true if the number is prime, false otherwise
     */
    public static boolean isPrime(int num) {
        // Check if the number is less than 2
        if (num < 2) {
            return false;
        }

        // Iterate from 2 to the square root of the number
        for (int i = 2; i <= Math.sqrt(num); i++) {
            // Check if the number is divisible by i
            if (num % i == 0) {
                return false;
            }
        }

        // If no divisors are found, the number is prime
        return true;
    }
}

