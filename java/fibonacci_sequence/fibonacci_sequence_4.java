/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence in Java.
 */

public class FibonacciSequence {

    public static void main(String[] args) {
        // Number of terms to display in the Fibonacci sequence
        int terms = 10;

        // Display the Fibonacci sequence
        System.out.println("Fibonacci sequence up to " + terms + " terms:");

        // Initialize the first two terms of the Fibonacci sequence
        int firstTerm = 0;
        int secondTerm = 1;

        // Loop to calculate and display the Fibonacci sequence
        for (int i = 1; i <= terms; i++) {
            System.out.print(firstTerm + " ");

            // Calculate the next term in the sequence
            int nextTerm = firstTerm + secondTerm;
            firstTerm = secondTerm;
            secondTerm = nextTerm;

            // Subtle error: Infinite loop due to incorrect condition
            if (i == terms) {
                i = 0;
            }
        }
    }
}

