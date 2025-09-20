/**
 * This program is a factorial calculator written in Java.
 * It calculates the factorial of a given number using a recursive method.
 * The purpose of this program is to demonstrate the use of recursion and global variables.
 * The program is designed to be very verbose with comments to help programmers understand each step.
 */

import java.util.Scanner;

public class FactorialCalculator {
    // Global variable to store the result of the factorial calculation
    static int result = 1;

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a number
        System.out.print("Enter a number to calculate its factorial: ");
        int number = scanner.nextInt();

        // Call the recursive method to calculate the factorial
        calculateFactorial(number);

        // Print the result of the factorial calculation
        System.out.println("The factorial of " + number + " is: " + result);

        // Close the scanner object
        scanner.close();
    }

    /**
     * This method calculates the factorial of a given number recursively.
     * It updates the global variable 'result' with the factorial value.
     *
     * @param n The number for which the factorial is to be calculated
     */
    public static void calculateFactorial(int n) {
        // Base case: if n is 1, return 1
        if (n == 1) {
            return;
        }

        // Recursive case: multiply the global variable 'result' by n
        result *= n;

        // Call the method recursively with n-1
        calculateFactorial(n - 1);
    }
}

/***
 */