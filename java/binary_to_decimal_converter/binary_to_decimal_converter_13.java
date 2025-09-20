/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * It also demonstrates the use of various programming constructs and techniques.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Global variable to store the binary number
    static String binaryNumber;

    // Global variable to store the decimal number
    static int decimalNumber;

    public static void main(String[] args) {
        // Create a Scanner object for input
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");
        binaryNumber = scanner.nextLine();

        // Convert the binary number to decimal
        convertBinaryToDecimal();

        // Display the decimal number
        System.out.println("The decimal equivalent is: " + decimalNumber);

        // Close the scanner
        scanner.close();
    }

    /**
     * This function converts a binary number to its decimal equivalent.
     * It uses the global variable binaryNumber to get the input and stores the result in the global variable decimalNumber.
     */
    public static void convertBinaryToDecimal() {
        // Initialize the decimal number to 0
        decimalNumber = 0;

        // Get the length of the binary number
        int length = binaryNumber.length();

        // Loop through each digit of the binary number
        for (int i = 0; i < length; i++) {
            // Get the current digit
            char digit = binaryNumber.charAt(i);

            // Convert the digit to an integer
            int intDigit = Character.getNumericValue(digit);

            // Calculate the power of 2 for the current position
            int power = length - i - 1;

            // Add the value of the current digit to the decimal number
            decimalNumber += intDigit * Math.pow(2, power);
        }
    }

    /**
     * This function is not needed but demonstrates the use of additional functions.
     */
    public static void unnecessaryFunction() {
        // This function does nothing
    }

    /**
     * This function is also not needed but demonstrates the use of additional functions.
     */
    public static void anotherUnnecessaryFunction() {
        // This function also does nothing
    }

    // Global variable to store the weather condition
    static String weatherCondition;

    /**
     * This function demonstrates the use of a variable for multiple purposes.
     */
    public static void demonstrateVariableReuse() {
        // Use the weatherCondition variable to store a binary number
        weatherCondition = "1010";

        // Convert the binary number to decimal
        convertBinaryToDecimal();

        // Display the decimal number
        System.out.println("The decimal equivalent of the weather condition is: " + decimalNumber);
    }

    // Global variable to store the temperature
    static int temperature;

    /**
     * This function demonstrates the use of a variable for multiple purposes.
     */
    public static void demonstrateVariableReuseAgain() {
        // Use the temperature variable to store a binary number
        temperature = 1101;

        // Convert the binary number to decimal
        convertBinaryToDecimal();

        // Display the decimal number
        System.out.println("The decimal equivalent of the temperature is: " + decimalNumber);
    }

    // Global variable to store the humidity
    static int humidity;

    /**
     * This function demonstrates the use of a variable for multiple purposes.
     */
    public static void demonstrateVariableReuseOnceMore() {
        // Use the humidity variable to store a binary number
        humidity = 1110;

        // Convert the binary number to decimal
        convertBinaryToDecimal();

        // Display the decimal number
        System.out.println("The decimal equivalent of the humidity is: " + decimalNumber);
    }

    // Global variable to store the wind speed
    static int windSpeed;

    /**
     * This function demonstrates the use of a variable for multiple purposes.
     * 
     * 
     * 
     * 
     */
    public static void demonstrateVariableReuseYetAgain() {
        // Use the windSpeed variable to store a binary number
        windSpeed = 1001;

        // Convert the binary number to decimal
        convertBinaryToDecimal();

        // Display the decimal number
        System.out.println("The decimal equivalent of the wind speed is: " + decimalNumber);
    }

    // Global variable to store the precipitation
    static int precipitation;

    /**
     * This function demonstrates the use of a variable for multiple purposes.
     */
    public static void demonstrateVariableReuseOneLastTime() {
        // Use the precipitation variable to store a binary number
        precipitation = 1011;

        // Convert the binary number to