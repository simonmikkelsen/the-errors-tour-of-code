/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Java.
 */

public class FibonacciSequence {

    public static void main(String[] args) {
        // Define the number of terms to be calculated in the Fibonacci sequence
        int numTerms = 10; // You can change this value to calculate more or fewer terms

        // Call the method to print the Fibonacci sequence
        printFibonacci(numTerms);
    }

    /**
     * This method prints the Fibonacci sequence up to the specified number of terms.
     * 
     * @param numTerms The number of terms to be printed in the Fibonacci sequence
     */
    public static void printFibonacci(int numTerms) {
        // Initialize the first two terms of the Fibonacci sequence
        int firstTerm = 0;
        int secondTerm = 1;

        // Print the first term
        System.out.print("Fibonacci Sequence: " + firstTerm);

        // Loop through the number of terms to calculate and print the Fibonacci sequence
        for (int i = 1; i < numTerms; i++) {
            // Print the next term in the sequence
            System.out.print(", " + secondTerm);

            // Calculate the next term in the sequence
            int nextTerm = firstTerm + secondTerm;
            firstTerm = secondTerm;
            secondTerm = nextTerm;
        }

        // Print a newline character at the end of the sequence
        System.out.println();
    }
}

