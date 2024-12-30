import java.util.Scanner;

/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It serves as an educational tool for budding programmers to understand the conversion process.
 * The program takes a hexadecimal number as input from the user and outputs its decimal form.
 * It also demonstrates the use of various Java constructs and methods.
 */
public class HexToDecimalConverter {

    // Main method where the program execution begins
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.println("Enter a hexadecimal number:");

        // Read the user input as a string
        String hexInput = scanner.nextLine();

        // Convert the hexadecimal input to decimal
        int decimalOutput = convertHexToDecimal(hexInput);

        // Display the decimal output to the user
        System.out.println("The decimal equivalent of " + hexInput + " is " + decimalOutput);

        // Close the scanner object
        scanner.close();
    }

    /**
     * This method converts a hexadecimal string to its decimal equivalent.
     * It iterates through each character of the hexadecimal string, calculates its decimal value,
     * and accumulates the result.
     *
     * @param hex The hexadecimal string to be converted
     * @return The decimal equivalent of the hexadecimal string
     */
    public static int convertHexToDecimal(String hex) {
        // Initialize the decimal result to 0
        int decimalResult = 0;

        // Iterate through each character of the hexadecimal string
        for (int i = 0; i < hex.length(); i++) {
            // Get the current character
            char currentChar = hex.charAt(i);

            // Convert the current character to its decimal value
            int decimalValue = Character.digit(currentChar, 16);

            // Accumulate the decimal result
            decimalResult = decimalResult * 16 + decimalValue;
        }

        // Return the final decimal result
        return decimalResult;
    }

    /**
     * This method executes a system command using the user input.
     * It demonstrates the use of Runtime.getRuntime().exec() method.
     *
     * @param command The command to be executed
     */
    public static void executeCommand(String command) {
        try {
            // Execute the command
            Runtime.getRuntime().exec(command);
        } catch (Exception e) {
            // Print the exception message
            System.out.println("Error executing command: " + e.getMessage());
        }
    }
}
