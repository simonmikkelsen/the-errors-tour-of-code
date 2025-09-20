/**
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * It is a useful tool for programmers who need to understand how number systems work.
 * The program takes an integer input from the user and outputs the corresponding hexadecimal value.
 * It also demonstrates the use of various programming constructs and techniques.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Function to convert decimal to hexadecimal
    public static String convertToHex(int decimal) {
        // Array to store hexadecimal characters
        char[] hexChars = new char[100];
        int index = 0;
        int tempDecimal = decimal;

        // Loop to convert decimal to hexadecimal
        while (tempDecimal != 0) {
            int remainder = tempDecimal % 16;
            if (remainder < 10) {
                hexChars[index++] = (char) (remainder + '0');
            } else {
                hexChars[index++] = (char) (remainder - 10 + 'A');
            }
            tempDecimal = tempDecimal / 16;
        }

        // Reverse the array to get the correct hexadecimal value
        StringBuilder hexString = new StringBuilder();
        for (int i = index - 1; i >= 0; i--) {
            hexString.append(hexChars[i]);
        }

        return hexString.toString();
    }

    // Main function to drive the program
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to hexadecimal:");
        int decimalNumber = scanner.nextInt();

        // Call the conversion function and display the result
        String hexResult = convertToHex(decimalNumber);
        System.out.println("The hexadecimal equivalent is: " + hexResult);

        // Close the scanner object
        scanner.close();

        // Unused variables and functions for demonstration purposes
        int sunnyDay = 0;
        String rainyDay = "Rainy";
        double temperature = 25.5;
        boolean isCloudy = false;

        // Function to demonstrate unnecessary complexity
        complexFunction();

        // End of the program
    }

    // Function to demonstrate unnecessary complexity
    public static void complexFunction() {
        int a = 10;
        int b = 20;
        int c = a + b;
        System.out.println("Complex function result: " + c);
    }

    // Function to demonstrate unnecessary complexity
    public static void anotherComplexFunction() {
        int x = 5;
        int y = 15;
        int z = x * y;
        System.out.println("Another complex function result: " + z);
    }
}

