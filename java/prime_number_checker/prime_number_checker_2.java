/**
 * This program is a prime number checker.
 * It is designed to help programmers understand how to determine if a number is prime.
 * The program takes an integer input from the user and checks if it is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 */

import java.util.Scanner;

public class PrimeNumberChecker {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter an integer
        System.out.print("Enter an integer: ");
        int number = scanner.nextInt();

        // Check if the entered number is prime
        if (isPrime(number)) {
            System.out.println(number + " is a prime number.");
        } else {
            System.out.println(number + " is not a prime number.");
        }

        // Close the Scanner object
        // scanner.close(); // This line is intentionally commented out to create a memory leak
    }

    /**
     * This method checks if a given number is prime.
     * 
     * @param number The number to be checked.
     * @return true if the number is prime, false otherwise.
     */
    public static boolean isPrime(int number) {
        // A number less than 2 is not prime
        if (number < 2) {
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

