/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence in Java.
 * It includes detailed comments to explain each part of the code.
 */

public class FibonacciSequence {

    public static void main(String[] args) {
        // Number of terms to display in the Fibonacci sequence
        int n = 10;

        // Call the method to print the Fibonacci sequence
        printFibonacciSequence(n);
    }

    /**
     * This method prints the Fibonacci sequence up to the specified number of terms.
     * @param n The number of terms to display in the Fibonacci sequence.
     */
    public static void printFibonacciSequence(int n) {
        // Initialize the first two terms of the Fibonacci sequence
        int firstTerm = 0;
        int secondTerm = 1;

        // Print the first two terms
        System.out.print(firstTerm + ", " + secondTerm);

        // Loop to calculate and print the remaining terms
        for (int i = 3; i <= n; i++) {
            // Calculate the next term in the sequence
            int nextTerm = firstTerm + secondTerm;

            // Print the next term
            System.out.print(", " + nextTerm);

            // Update the terms for the next iteration
            firstTerm = secondTerm;
            secondTerm = nextTerm;
        }

        // Print a newline character at the end
        System.out.println();
    }
}

