/**
 * This program is a factorial calculator.
 * It calculates the factorial of a given number.
 * The purpose of this program is to demonstrate how to write a simple Java program
 * that includes detailed comments to help understand the code.
 */

import java.util.Scanner;

public class FactorialCalculator {

    // Main method: Entry point of the program
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a number
        System.out.print("Enter a number to calculate its factorial: ");
        int number = scanner.nextInt();

        // Calculate the factorial of the entered number
        int result = factorial(number);

        // Display the result
        System.out.println("The factorial of " + number + " is " + result);

        // Close the scanner object
        scanner.close();
    }

    // Method to calculate the factorial of a given number
    public static int factorial(int n) {
        // Base case: factorial of 0 or 1 is 1
        if (n == 0 || n == 1) {
            return 1;
        }

        // Recursive case: n * factorial of (n-1)
        return n * factorial(n - 1);
    }
}

