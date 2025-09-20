/**
 * This program is a prime number checker.
 * It takes an integer input from the user and checks if the number is prime.
 * The program is designed to be verbose and educational, with detailed comments explaining each step.
 */

import java.util.Scanner;

public class PrimeNumberChecker {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a number
        System.out.print("Enter a number to check if it is prime: ");
        String input = scanner.nextLine();

        // Convert the input to an integer
        int number = Integer.parseInt(input);

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
     * A prime number is a number that is only divisible by 1 and itself.
     *
     * @param number The number to check
     * @return true if the number is prime, false otherwise
     */
    public static boolean isPrime(int number) {
        // Handle edge cases
        if (number <= 1) {
            return false;
        }

        // Check divisibility from 2 to the square root of the number
        for (int i = 2; i <= Math.sqrt(number); i++) {
            if (number % i == 0) {
                return false;
            }
        }

        // If no divisors were found, the number is prime
        return true;
    }
}

