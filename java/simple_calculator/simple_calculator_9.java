/**
 * This program is a simple calculator that performs basic arithmetic operations.
 * It is designed to help programmers practice their debugging skills by identifying
 * and fixing errors in the code.
 */

import java.util.Scanner;

public class SimpleCalculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter first number: ");
        double num1 = scanner.nextDouble();

        System.out.println("Enter second number: ");
        double num2 = scanner.nextDouble();

        System.out.println("Choose an operation (+, -, *, /): ");
        char operation = scanner.next().charAt(0);

        double result = 0;

        switch (operation) {
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
                result = num1 / num2;
                break;
            default:
                System.out.println("Invalid operation");
                return;
        }

        System.out.println("The result is: " + result);
    }
}

