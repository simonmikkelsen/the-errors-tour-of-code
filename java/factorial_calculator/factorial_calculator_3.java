/**
 * This program is a factorial calculator written in Java.
 * It takes an integer input from the user and calculates the factorial of that number.
 * The purpose of this program is to demonstrate basic Java programming concepts such as:
 * - Input and output operations
 * - Looping constructs
 * - Exception handling
 * - Resource management
 */

import java.util.Scanner;

public class FactorialCalculator {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter an integer
        System.out.print("Enter a positive integer: ");
        int number = scanner.nextInt();

        // Calculate the factorial of the entered number
        long factorial = calculateFactorial(number);

        // Display the result to the user
        System.out.println("The factorial of " + number + " is " + factorial);

        // Close the Scanner object
        // scanner.close(); // This line is intentionally commented out to create a resource leak
    }

    /**
     * This method calculates the factorial of a given number.
     * It uses a for loop to multiply the numbers from 1 to the given number.
     *
     * @param number The number for which the factorial is to be calculated
     * @return The factorial of the given number
     */
    public static long calculateFactorial(int number) {
        long result = 1;
        for (int i = 1; i <= number; i++) {
            result *= i;
        }
        return result;
    }
}

