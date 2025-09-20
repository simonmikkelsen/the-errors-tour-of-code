/**
 * PrimeNumberChecker.java
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * 
 * The purpose of this program is to help programmers understand the logic behind prime number checking
 * and to practice writing and debugging Java code.
 */

import java.util.Scanner;

public class PrimeNumberChecker {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter an integer
        System.out.print("Enter an integer: ");
        int number = scanner.nextInt();

        // Check if the entered number is a prime number
        boolean isPrime = isPrime(number);

        // Display the result to the user
        if (isPrime) {
            System.out.println(number + " is a prime number.");
        } else {
            System.out.println(number + " is not a prime number.");
        }

        // Close the scanner object
        scanner.close();
    }

    /**
     * This method checks if a given number is a prime number.
     * 
     * @param number The number to be checked.
     * @return true if the number is prime, false otherwise.
     */
    public static boolean isPrime(int number) {
        // A prime number is greater than 1
        if (number <= 1) {
            return false;
        }

        // Check for factors from 2 to the square root of the number
        for (int i = 2; i <= Math.sqrt(number); i++) {
            // If the number is divisible by any number other than 1 and itself, it is not prime
            if (number % i == 0) {
                return false;
            }
        }

        // If no factors were found, the number is prime
        return true;
    }
}

