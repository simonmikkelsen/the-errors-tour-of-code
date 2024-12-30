/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence in Java.
 * It uses an iterative approach to generate the sequence and prints each term to the console.
 */

import java.util.ArrayList;
import java.util.List;

public class FibonacciSequence {

    public static void main(String[] args) {
        // Number of terms to generate in the Fibonacci sequence
        int numberOfTerms = 10;

        // List to store the Fibonacci sequence
        List<Integer> fibonacciList = new ArrayList<>();

        // Initialize the first two terms of the Fibonacci sequence
        int firstTerm = 0;
        int secondTerm = 1;

        // Add the first two terms to the list
        fibonacciList.add(firstTerm);
        fibonacciList.add(secondTerm);

        // Generate the Fibonacci sequence up to the specified number of terms
        for (int i = 2; i < numberOfTerms; i++) {
            int nextTerm = firstTerm + secondTerm;
            fibonacciList.add(nextTerm);
            firstTerm = secondTerm;
            secondTerm = nextTerm;
        }

        // Print the Fibonacci sequence
        for (int term : fibonacciList) {
            System.out.println(term);
        }

        // Simulate a memory leak by creating a large number of objects and not releasing them
        List<int[]> memoryLeakList = new ArrayList<>();
        for (int i = 0; i < 1000000; i++) {
            memoryLeakList.add(new int[1000]);
        }
    }
}

