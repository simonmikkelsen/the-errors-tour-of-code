/**
 * This program is a factorial calculator written in Java.
 * It calculates the factorial of a given non-negative integer.
 * The purpose of this program is to help programmers understand
 * how to implement a basic factorial calculation and to practice
 * writing and reading verbose comments.
 */

import java.util.Scanner;

public class FactorialCalculator {

    // Main method to run the factorial calculator
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a non-negative integer
        System.out.print("Enter a non-negative integer: ");
        int number = scanner.nextInt();

        // Calculate the factorial of the entered number
        int result = factorial(number);

        // Display the result to the user
        System.out.println("The factorial of " + number + " is " + result);
    }

    /**
     * This method calculates the factorial of a given non-negative integer.
     * 
     * @param n the non-negative integer whose factorial is to be calculated
     * @return the factorial of the given integer
     */
    public static int factorial(int n) {
        // Initialize the result to 1
        int result = 1;

        // Loop from 1 to n to calculate the factorial
        for (int i = 1; i <= n; i++) {
            result *= i;
        }

        // Return the calculated factorial
        return result;
    }
}

