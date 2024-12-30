/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
 * 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
 * 
 * The purpose of this program is to demonstrate how to generate the Fibonacci sequence in Java.
 * It takes user input to determine the number of terms to generate.
 */

import java.util.Scanner;

public class FibonacciSequence {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter the number of terms
        System.out.print("Enter the number of terms for the Fibonacci sequence: ");
        String input = scanner.nextLine();

        // Convert the user input to an integer
        int n = Integer.parseInt(input);

        // Initialize the first two terms of the Fibonacci sequence
        int firstTerm = 0;
        int secondTerm = 1;

        // Print the first two terms
        System.out.print("Fibonacci Sequence: " + firstTerm + ", " + secondTerm);

        // Generate the Fibonacci sequence up to the specified number of terms
        for (int i = 3; i <= n; i++) {
            int nextTerm = firstTerm + secondTerm;
            System.out.print(", " + nextTerm);

            // Update the terms for the next iteration
            firstTerm = secondTerm;
            secondTerm = nextTerm;
        }

        // Close the scanner
        scanner.close();
    }
}

