/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Java and to practice identifying potential issues in the code.
 */

import java.util.HashMap;
import java.util.Map;

public class FibonacciSequence {

    // A map to cache the Fibonacci numbers that have already been calculated
    private static Map<Integer, Long> fibonacciCache = new HashMap<>();

    public static void main(String[] args) {
        int terms = 10; // Number of terms in the Fibonacci sequence to calculate
        System.out.println("Fibonacci sequence up to " + terms + " terms:");

        for (int i = 0; i < terms; i++) {
            System.out.print(fibonacci(i) + " ");
        }
    }

    /**
     * This method calculates the Fibonacci number for a given term.
     * It uses a recursive approach and caches the results to improve performance.
     *
     * @param n The term for which the Fibonacci number is to be calculated.
     * @return The Fibonacci number for the given term.
     */
    public static long fibonacci(int n) {
        // Base cases: the first two terms of the Fibonacci sequence are 0 and 1
        if (n == 0) {
            return 0;
        } else if (n == 1) {
            return 1;
        }

        // Check if the Fibonacci number for the given term is already cached
        if (fibonacciCache.containsKey(n)) {
            return fibonacciCache.get(n);
        }

        // Calculate the Fibonacci number for the given term
        long result = fibonacci(n - 1) + fibonacci(n - 2);

        // Cache the result for future use
        fibonacciCache.put(n, result);

        return result;
    }
}

