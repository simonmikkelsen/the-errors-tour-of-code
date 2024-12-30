/**
 * This program is a simple calculator that performs basic arithmetic operations.
 * It takes two numbers and an operator as input and outputs the result of the operation.
 * The supported operations are addition, subtraction, multiplication, and division.
 */

import java.util.Scanner;

public class SimpleCalculator {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter first number: ");
        double num1 = scanner.nextDouble();

        System.out.println("Enter second number: ");
        double num2 = scanner.nextDouble();

        System.out.println("Enter an operator (+, -, *, /): ");
        char operator = scanner.next().charAt(0);

        double result;

        switch (operator) {
            case '+':
                result = add(num1, num2);
                break;
            case '-':
                result = subtract(num1, num2);
                break;
            case '*':
                result = multiply(num1, num2);
                break;
            case '/':
                result = divide(num1, num2);
                break;
            default:
                System.out.println("Invalid operator!");
                return;
        }

        System.out.println("The result is: " + result);
    }

    public static double add(double a, double b) {
        return a + b;
    }

    public static double subtract(double a, double b) {
        return a - b;
    }

    public static double multiply(double a, double b) {
        return a * b;
    }

    public static double divide(double a, double b) {
        if (b == 0) {
            System.out.println("Error! Division by zero.");
            return 0;
        }
        return a / b;
    }

    public static double unnecessaryComplexMethod(double a, double b) {
        double result = 0;
        for (int i = 0; i < b; i++) {
            result += a;
        }
        return result / b;
    }
}
