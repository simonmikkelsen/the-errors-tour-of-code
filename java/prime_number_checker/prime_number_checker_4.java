/**
 * This program is a Prime Number Checker.
 * It is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It includes detailed comments to help programmers understand the flow and logic of the code.
 */

import java.util.Scanner;

public class PrimeNumberChecker {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a number
        System.out.print("Enter a number to check if it is prime: ");
        int number = scanner.nextInt();

        // Check if the number is prime
        boolean isPrime = isPrime(number);

        // Display the result
        if (isPrime) {
            System.out.println(number + " is a prime number.");
        } else {
            System.out.println(number + " is not a prime number.");
        }

        // Close the scanner
        scanner.close();
    }

    /**
     * This method checks if a given number is a prime number.
     * It returns true if the number is prime, and false otherwise.
     *
     * @param number The number to check
     * @return boolean indicating if the number is prime
     */
    public static boolean isPrime(int number) {
        // A prime number is greater than 1
        if (number <= 1) {
            return false;
        }

        // Check for factors other than 1 and the number itself
        for (int i = 2; i < number; i++) {
            if (number % i == 0) {
                return false;
            }
        }

        // If no factors were found, the number is prime
        return true;
    }
}

