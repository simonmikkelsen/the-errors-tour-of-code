/**
 * This program is a factorial calculator implemented in Java.
 * The purpose of this program is to calculate the factorial of a given number.
 * It uses regular expressions to validate the input and ensure it is a non-negative integer.
 * The program is designed to be verbose with comments to help programmers understand each step.
 */

import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class FactorialCalculator {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a non-negative integer
        System.out.println("Enter a non-negative integer to calculate its factorial:");

        // Read the input from the user
        String input = scanner.nextLine();

        // Define a regular expression pattern to match a non-negative integer
        Pattern pattern = Pattern.compile("^[0-9]+$");

        // Create a matcher object to match the input against the pattern
        Matcher matcher = pattern.matcher(input);

        // Check if the input matches the pattern
        if (matcher.matches()) {
            // Convert the input to an integer
            int number = Integer.parseInt(input);

            // Calculate the factorial of the number
            long factorial = calculateFactorial(number);

            // Print the result
            System.out.println("The factorial of " + number + " is " + factorial);
        } else {
            // Print an error message if the input is not a non-negative integer
            System.out.println("Invalid input. Please enter a non-negative integer.");
        }

        // Close the scanner
        scanner.close();
    }

    /**
     * This method calculates the factorial of a given number.
     * 
     * @param n The number to calculate the factorial of.
     * @return The factorial of the given number.
     */
    public static long calculateFactorial(int n) {
        // Initialize the result to 1
        long result = 1;

        // Loop from 1 to n to calculate the factorial
        for (int i = 1; i <= n; i++) {
            result *= i;
        }

        // Return the result
        return result;
    }
}

