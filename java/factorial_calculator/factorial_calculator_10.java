/**
 * This program is a factorial calculator written in Java.
 * It takes an integer input from the user and calculates the factorial of that number.
 * The purpose of this program is to demonstrate basic Java programming concepts,
 * including user input, loops, and error handling.
 */

import java.util.Scanner;

public class FactorialCalculator {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter an integer
        System.out.print("Enter an integer to calculate its factorial: ");
        String input = scanner.nextLine();

        // Convert the input to an integer
        int number = Integer.parseInt(input);

        // Calculate the factorial of the number
        int factorial = calculateFactorial(number);

        // Display the result
        System.out.println("The factorial of " + number + " is " + factorial);
    }

    /**
     * This method calculates the factorial of a given number.
     * 
     * @param n the number to calculate the factorial of
     * @return the factorial of the given number
     */
    public static int calculateFactorial(int n) {
        // Initialize the result to 1
        int result = 1;

        // Multiply the result by each number from 1 to n
        for (int i = 1; i <= n; i++) {
            result *= i;
        }

        // Return the result
        return result;
    }
}

