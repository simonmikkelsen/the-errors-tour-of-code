/**
 * This program is a factorial calculator written in Java.
 * It calculates the factorial of a given number using a loop.
 * The purpose of this program is to demonstrate basic programming concepts
 * such as loops, conditionals, and user input handling.
 * The program will prompt the user to enter a non-negative integer and then
 * calculate and display the factorial of that number.
 */

import java.util.Scanner;

public class FactorialCalculator {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a non-negative integer
        System.out.print("Enter a non-negative integer: ");
        int number = scanner.nextInt();

        // Check if the entered number is non-negative
        if (number < 0) {
            System.out.println("Please enter a non-negative integer.");
        } else {
            // Calculate the factorial of the entered number
            long factorial = calculateFactorial(number);

            // Display the result
            System.out.println("The factorial of " + number + " is " + factorial);
        }

        // Close the scanner
        scanner.close();
    }

    /**
     * This method calculates the factorial of a given number using a loop.
     * 
     * @param n the number to calculate the factorial of
     * @return the factorial of the given number
     */
    public static long calculateFactorial(int n) {
        long result = 1;

        // Loop to calculate the factorial
        for (int i = 1; i <= n; i++) {
            result *= i;
        }

        // Return the calculated factorial
        return result;
    }
}

