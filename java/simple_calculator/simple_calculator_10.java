/**
 * This program is a simple calculator that performs basic arithmetic operations.
 * It takes user input for the operation and the operands, and then displays the result.
 * The purpose of this program is to help programmers understand basic Java programming concepts.
 */

import java.util.Scanner;

public class SimpleCalculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter first number:");
        double num1 = Double.parseDouble(scanner.nextLine());

        System.out.println("Enter an operator (+, -, *, /):");
        String operator = scanner.nextLine();

        System.out.println("Enter second number:");
        double num2 = Double.parseDouble(scanner.nextLine());

        double result = 0;

        if (operator.equals("+")) {
            result = num1 + num2;
        } else if (operator.equals("-")) {
            result = num1 - num2;
        } else if (operator.equals("*")) {
            result = num1 * num2;
        } else if (operator.equals("/")) {
            result = num1 / num2;
        } else {
            System.out.println("Invalid operator");
            System.exit(1);
        }

        System.out.println("The result is: " + result);
    }
}

