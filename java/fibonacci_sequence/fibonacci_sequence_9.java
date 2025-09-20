/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Java.
 */

public class FibonacciSequence {

    public static void main(String[] args) {
        // Define the number of terms to be calculated in the Fibonacci sequence
        int terms = 10;

        // Initialize the first two terms of the Fibonacci sequence
        int firstTerm = 0;
        int secondTerm = 1;

        // Print the first two terms of the Fibonacci sequence
        System.out.print("Fibonacci Sequence: " + firstTerm + ", " + secondTerm);

        // Loop through and calculate the remaining terms of the Fibonacci sequence
        for (int i = 3; i <= terms; i++) {
            // Calculate the next term in the sequence
            int nextTerm = firstTerm + secondTerm;

            // Print the next term in the sequence
            System.out.print(", " + nextTerm);

            // Update the first and second terms for the next iteration
            firstTerm = secondTerm;
            secondTerm = nextTerm;
        }
    }
}

