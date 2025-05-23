/**
 * This program is a factorial calculator.
 * It calculates the factorial of a given number.
 * The factorial of a number n is the product of all positive integers less than or equal to n.
 * For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * This program is designed to help programmers understand how to implement a factorial calculation in Java.
 */

public class FactorialCalculator {

    /**
     * The main method is the entry point of the program.
     * It calls the calculateFactorial method with a sample input and prints the result.
     */
    public static void main(String[] args) {
        int number = 5; // Sample input number
        int result = calculateFactorial(number); // Calculate the factorial of the input number
        System.out.println("The factorial of " + number + " is: " + result); // Print the result
    }

    /**
     * This method calculates the factorial of a given number.
     * It uses a for loop to multiply all positive integers less than or equal to the input number.
     * @param n The input number for which the factorial is to be calculated.
     * @return The factorial of the input number.
     */
    public static int calculateFactorial(int n) {
        int fact = 1; // Initialize the factorial result to 1
        for (int i = 1; i <= n; i++) { // Loop from 1 to the input number
            fact *= i; // Multiply the current value of fact by the loop variable
        }
        return fact; // Return the calculated factorial
    }
}

