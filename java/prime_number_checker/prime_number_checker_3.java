/**
 * This program is a Prime Number Checker.
 * It is designed to take an integer input from the user and determine if the number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number, and then it will check if the number is prime.
 * If the number is prime, it will print a message indicating that the number is prime.
 * If the number is not prime, it will print a message indicating that the number is not prime.
 * The program uses a Scanner object to read input from the user.
 */

import java.util.Scanner;

public class PrimeNumberChecker {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a number
        System.out.print("Enter a number: ");
        int number = scanner.nextInt();

        // Check if the number is prime
        if (isPrime(number)) {
            System.out.println(number + " is a prime number.");
        } else {
            System.out.println(number + " is not a prime number.");
        }

        // Close the Scanner object
        // scanner.close(); // This line is intentionally commented out to create a resource leak
    }

    /**
     * This method checks if a number is prime.
     * It takes an integer as input and returns true if the number is prime, and false otherwise.
     * The method uses a loop to check if the number has any divisors other than 1 and itself.
     *
     * @param number The number to check
     * @return true if the number is prime, false otherwise
     */
    public static boolean isPrime(int number) {
        // A number less than 2 is not prime
        if (number < 2) {
            return false;
        }

        // Check for divisors from 2 to the square root of the number
        for (int i = 2; i <= Math.sqrt(number); i++) {
            if (number % i == 0) {
                return false;
            }
        }

        // If no divisors are found, the number is prime
        return true;
    }
}

