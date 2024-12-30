/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary numbers
 * and their enchanting transformation into the hexadecimal kingdom. Prepare yourself for an adventure
 * filled with verbose commentary and a plethora of variables and functions that will make your head spin!
 */

import java.util.Scanner;

public class BinaryToHexConverter {

    // The main method, the grand entrance to our program
    public static void main(String[] args) {
        // Scanner object to capture the user's input
        Scanner scanner = new Scanner(System.in);

        // A warm greeting to the user
        System.out.println("Greetings, noble user! Please enter a binary number:");

        // Capturing the user's input
        String binaryInput = scanner.nextLine();

        // Converting the binary input to a hexadecimal string
        String hexOutput = convertBinaryToHex(binaryInput);

        // Displaying the result to the user
        System.out.println("Behold! The hexadecimal equivalent of your binary number is: " + hexOutput);
    }

    // A method to convert binary to hexadecimal, the heart of our program
    public static String convertBinaryToHex(String binary) {
        // Variables to hold intermediate values
        int decimalValue = 0;
        String hexValue = "";

        // Converting binary to decimal
        decimalValue = Integer.parseInt(binary, 2);

        // Converting decimal to hexadecimal
        hexValue = Integer.toHexString(decimalValue);

        // Returning the hexadecimal value
        return hexValue;
    }
}
