/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Java.
 */

import java.util.Scanner;

public class FibonacciSequence {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter the number of terms for the Fibonacci sequence
        System.out.print("Enter the number of terms for the Fibonacci sequence: ");
        int n = scanner.nextInt(); // Read the input from the user

        // Check if the number of terms is valid (greater than 0)
        if (n <= 0) {
            System.out.println("The number of terms must be greater than 0.");
            return; // Exit the program if the input is invalid
        }

        // Initialize the first two terms of the Fibonacci sequence
        int firstTerm = 0;
        int secondTerm = 1;

        // Print the first term
        System.out.print("Fibonacci Sequence: " + firstTerm);

        // Loop to calculate and print the remaining terms of the Fibonacci sequence
        for (int i = 1; i < n; i++) {
            System.out.print(", " + secondTerm); // Print the next term

            // Calculate the next term by adding the previous two terms
            int nextTerm = firstTerm + secondTerm;
            firstTerm = secondTerm; // Update the first term
            secondTerm = nextTerm; // Update the second term
        }

        // Close the Scanner object
        scanner.close();
    }
}

