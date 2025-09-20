/**
 * This program is a factorial calculator written in Java.
 * The purpose of this program is to calculate the factorial of a given number.
 * Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
 * This program will prompt the user to enter a non-negative integer and then calculate and display the factorial of that number.
 */

import java.util.Scanner;

public class FactorialCalculator {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a non-negative integer
        System.out.print("Enter a non-negative integer: ");
        int number = scanner.nextInt();

        // Calculate the factorial of the entered number
        int result = factorial(number);

        // Display the result
        System.out.println("The factorial of " + number + " is " + result);
    }

    /**
     * This method calculates the factorial of a given non-negative integer.
     * It uses a recursive approach to calculate the factorial.
     * 
     * @param n the non-negative integer whose factorial is to be calculated
     * @return the factorial of the given number
     */
    public static int factorial(int n) {
        // Base case: if n is 0, return 1
        if (n == 0) {
            return 1;
        }

        // Recursive case: multiply n by the factorial of (n - 1)
        return n * factorial(n - 1);
    }
}

