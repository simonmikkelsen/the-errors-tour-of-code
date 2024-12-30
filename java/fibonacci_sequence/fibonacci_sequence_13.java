/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Java.
 */

public class FibonacciSequence {
    // Global variable to store the number of terms in the Fibonacci sequence
    static int numTerms;

    // Global variable to store the Fibonacci sequence
    static int[] fibonacciSeries;

    public static void main(String[] args) {
        // Initialize the number of terms in the Fibonacci sequence
        numTerms = 10; // You can change this value to generate more or fewer terms

        // Initialize the Fibonacci series array with the specified number of terms
        fibonacciSeries = new int[numTerms];

        // Generate the Fibonacci sequence
        generateFibonacciSequence();

        // Print the Fibonacci sequence
        printFibonacciSequence();
    }

    /**
     * This method generates the Fibonacci sequence and stores it in the global array fibonacciSeries.
     */
    public static void generateFibonacciSequence() {
        // The first term of the Fibonacci sequence is always 0
        fibonacciSeries[0] = 0;

        // The second term of the Fibonacci sequence is always 1
        if (numTerms > 1) {
            fibonacciSeries[1] = 1;
        }

        // Generate the remaining terms of the Fibonacci sequence
        for (int i = 2; i < numTerms; i++) {
            fibonacciSeries[i] = fibonacciSeries[i - 1] + fibonacciSeries[i - 2];
        }
    }

    /**
     * This method prints the Fibonacci sequence stored in the global array fibonacciSeries.
     */
    public static void printFibonacciSequence() {
        System.out.println("Fibonacci sequence up to " + numTerms + " terms:");

        // Loop through the array and print each term of the Fibonacci sequence
        for (int i = 0; i < numTerms; i++) {
            System.out.print(fibonacciSeries[i] + " ");
        }
        System.out.println();
    }
}

