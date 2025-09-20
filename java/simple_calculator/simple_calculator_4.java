/**
 * This program is a simple calculator that performs basic arithmetic operations.
 * It takes two numbers and an operator as input and displays the result.
 * The supported operations are addition, subtraction, multiplication, and division.
 */

import java.util.Scanner;

public class SimpleCalculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter first number:");
        double num1 = scanner.nextDouble();

        System.out.println("Enter an operator (+, -, *, /):");
        char operator = scanner.next().charAt(0);

        System.out.println("Enter second number:");
        double num2 = scanner.nextDouble();

        double result;

        while (true) {
            switch (operator) {
                case '+':
                    result = num1 + num2;
                    break;
                case '-':
                    result = num1 - num2;
                    break;
                case '*':
                    result = num1 * num2;
                    break;
                case '/':
                    if (num2 != 0) {
                        result = num1 / num2;
                    } else {
                        System.out.println("Error! Division by zero.");
                        return;
                    }
                    break;
                default:
                    System.out.println("Error! Invalid operator.");
                    return;
            }
            System.out.println("The result is: " + result);
        }
    }
}

