/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence using Java. It also demonstrates the use of regular expressions for input validation.
 */

import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class FibonacciSequence {

    public static void main(String[] args) {
        // Create a Scanner object for reading input from the console
        Scanner scanner = new Scanner(System.in);

        // Define a regular expression pattern for validating the input
        String regex = "\\d+";
        Pattern pattern = Pattern.compile(regex);

        // Prompt the user to enter the number of terms
        System.out.print("Enter the number of terms for the Fibonacci sequence: ");
        String input = scanner.nextLine();

        // Match the input against the regular expression pattern
        Matcher matcher = pattern.matcher(input);

        // Check if the input is a valid number
        if (matcher.matches()) {
            // Parse the input to an integer
            int n = Integer.parseInt(input);

            // Initialize the first two terms of the Fibonacci sequence
            int t1 = 0, t2 = 1;

            // Print the first two terms
            System.out.print("First " + n + " terms of Fibonacci sequence: " + t1 + ", " + t2);

            // Calculate and print the remaining terms
            for (int i = 3; i <= n; i++) {
                int nextTerm = t1 + t2;
                System.out.print(", " + nextTerm);
                t1 = t2;
                t2 = nextTerm;
            }
        } else {
            // Print an error message if the input is not a valid number
            System.out.println("Invalid input. Please enter a positive integer.");
        }

        // Close the scanner
        scanner.close();
    }
}

