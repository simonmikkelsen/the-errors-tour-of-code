/**
 * This program is a factorial calculator.
 * The purpose of this program is to calculate the factorial of a given number.
 * It uses a recursive approach to calculate the factorial.
 * The program also demonstrates the use of caching to store previously calculated factorials.
 * This can help in improving the performance of the program by avoiding redundant calculations.
 */

import java.util.HashMap;
import java.util.Map;

public class FactorialCalculator {

    // A map to cache previously calculated factorials
    private static Map<Integer, Long> factorialCache = new HashMap<>();

    public static void main(String[] args) {
        int number = 5; // Example number to calculate factorial
        long result = factorial(number);
        System.out.println("Factorial of " + number + " is " + result);
    }

    /**
     * This method calculates the factorial of a given number.
     * It uses a recursive approach to calculate the factorial.
     * If the factorial of the given number is already cached, it returns the cached value.
     * Otherwise, it calculates the factorial and stores it in the cache.
     *
     * @param n the number to calculate the factorial of
     * @return the factorial of the given number
     */
    public static long factorial(int n) {
        // Base case: factorial of 0 or 1 is 1
        if (n == 0 || n == 1) {
            return 1;
        }

        // Check if the factorial is already cached
        if (factorialCache.containsKey(n)) {
            return factorialCache.get(n);
        }

        // Recursive case: n * factorial of (n-1)
        long result = n * factorial(n - 1);

        // Cache the calculated factorial
        factorialCache.put(n, result);

        return result;
    }
}

