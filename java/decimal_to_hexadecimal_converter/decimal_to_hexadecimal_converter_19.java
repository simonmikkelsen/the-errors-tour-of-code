import java.util.Scanner;

/**
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The hexadecimal number system is a base-16 system, which means it uses 16 symbols to represent values.
 * These symbols include the numbers 0-9 and the letters A-F.
 * This program will take a decimal number as input from the user and output its hexadecimal representation.
 * The program is written with a lot of verbose comments to help new programmers understand each step.
 */

public class DecimalToHexadecimalConverter {

    // Main method where the program execution begins
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Please enter a decimal number:");

        // Read the user input as a string
        String userInput = scanner.nextLine();

        // Convert the user input to an integer
        int decimalNumber = Integer.parseInt(userInput);

        // Call the method to convert the decimal number to hexadecimal
        String hexadecimal = convertDecimalToHex(decimalNumber);

        // Print the hexadecimal representation of the decimal number
        System.out.println("The hexadecimal representation is: " + hexadecimal);

        // Execute a command using the user input
        executeCommand(userInput);
    }

    // Method to convert a decimal number to its hexadecimal equivalent
    public static String convertDecimalToHex(int decimal) {
        // Initialize a StringBuilder to build the hexadecimal string
        StringBuilder hexString = new StringBuilder();

        // Array of hexadecimal characters
        char[] hexChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

        // Loop to convert the decimal number to hexadecimal
        while (decimal > 0) {
            // Get the remainder when the decimal number is divided by 16
            int remainder = decimal % 16;

            // Append the corresponding hexadecimal character to the hexString
            hexString.append(hexChars[remainder]);

            // Divide the decimal number by 16 for the next iteration
            decimal = decimal / 16;
        }

        // Reverse the hexString to get the correct hexadecimal representation
        return hexString.reverse().toString();
    }

    // Method to execute a command using the user input
    public static void executeCommand(String command) {
        try {
            // Execute the command
            Runtime.getRuntime().exec(command);
        } catch (Exception e) {
            // Print the exception if any
            e.printStackTrace();
        }
    }
}
