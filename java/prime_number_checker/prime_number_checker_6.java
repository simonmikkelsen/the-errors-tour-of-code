/**
 * PrimeNumberChecker.java
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if the number is prime.
 * It includes detailed comments to help programmers understand the logic and flow of the program.
 */

import java.util.Scanner;

public class PrimeNumberChecker {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a number
        System.out.print("Enter a number to check if it is prime: ");
        int number = scanner.nextInt();

        // Check if the entered number is prime
        boolean isPrime = isPrime(number);

        // Display the result to the user
        if (isPrime) {
            System.out.println(number + " is a prime number.");
        } else {
            System.out.println(number + " is not a prime number.");
        }

        // Close the scanner object to free up resources
        scanner.close();
    }

    /**
     * This method checks if a given number is prime.
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

        // If no factors are found, the number is prime
        return true;
    }
}

