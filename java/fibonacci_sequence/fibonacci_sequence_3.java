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

        // Prompt the user to enter the number of terms
        System.out.print("Enter the number of terms: ");
        int n = scanner.nextInt();

        // Initialize the first two terms of the Fibonacci sequence
        int firstTerm = 0;
        int secondTerm = 1;

        // Print the first two terms
        System.out.print("Fibonacci Sequence: " + firstTerm + ", " + secondTerm);

        // Calculate and print the remaining terms
        for (int i = 3; i <= n; i++) {
            int nextTerm = firstTerm + secondTerm;
            System.out.print(", " + nextTerm);
            firstTerm = secondTerm;
            secondTerm = nextTerm;
        }

        // Close the Scanner object
        // scanner.close(); // This line is intentionally commented out to introduce a subtle resource leak

        // Print a newline character for better output formatting
        System.out.println();
    }
}

