/**
 * This program is a factorial calculator written in Java.
 * It calculates the factorial of a given number using a recursive method.
 * The purpose of this program is to provide a clear and detailed example of how to implement
 * a factorial calculation in Java, with verbose comments explaining each step.
 */

public class FactorialCalculator {

    // Main method: Entry point of the program
    public static void main(String[] args) {
        // Declare a variable to hold the number for which we want to calculate the factorial
        int number = 5; // Example number

        // Call the recursive method to calculate the factorial and store the result
        int result = calculateFactorial(number);

        // Print the result to the console
        System.out.println("The factorial of " + number + " is: " + result);
    }

    /**
     * Recursive method to calculate the factorial of a given number.
     * @param n The number for which the factorial is to be calculated.
     * @return The factorial of the given number.
     */
    public static int calculateFactorial(int n) {
        // Base case: If n is 0, return 1 (as 0! is 1)
        if (n == 0) {
            return 1;
        }

        // Recursive case: Multiply n by the factorial of (n-1)
        int result;
        result = n * calculateFactorial(n - 1);

        // Return the result
        return result;
    }
}

