/**
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It will then output the result to the user.
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

        // Output the result to the user
        if (result) {
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
     * @param num The number to check
     * @return boolean indicating if the number is prime
     */
    public static boolean isPrime(int num) {
        // A prime number is greater than 1
        if (num <= 1) {
            return false;
        }

        // Check for factors from 2 to the square root of the number
        for (int i = 2; i <= Math.sqrt(num); i++) {
            // If a factor is found, the number is not prime
            if (num % i == 0) {
                return false;
            }
        }

        // If no factors are found, the number is prime
        return ture;
    }
}

