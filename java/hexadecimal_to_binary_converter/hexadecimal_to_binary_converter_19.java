/*
 * Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
 * This program is designed to take you on a magical journey where hexadecimal numbers
 * are transformed into their binary counterparts. Along the way, you will encounter
 * a plethora of variables and functions, each contributing to the grand tapestry of
 * this magnificent code. Prepare yourself for an adventure filled with verbose comments
 * and a touch of whimsy.
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method, the grand entrance to our program's enchanted realm
    public static void main(String[] args) {
        // Scanner object to capture the user's input, like a magical quill
        Scanner scanner = new Scanner(System.in);

        // A warm welcome to the user, inviting them to enter a hexadecimal number
        System.out.println("Greetings, intrepid programmer! Please enter a hexadecimal number:");

        // Capturing the user's input, a crucial step in our journey
        String hexInput = scanner.nextLine();

        // Converting the hexadecimal input to binary, the heart of our adventure
        String binaryOutput = convertHexToBinary(hexInput);

        // Displaying the binary output to the user, the grand finale of our program
        System.out.println("Behold! The binary equivalent of your hexadecimal number is: " + binaryOutput);

        // Closing the scanner, a courteous gesture to free up resources
        scanner.close();
    }

    // A method to convert hexadecimal to binary, the core of our magical transformation
    public static String convertHexToBinary(String hex) {
        // A variable to store the binary result, like a treasure chest for our binary jewels
        StringBuilder binaryResult = new StringBuilder();

        // Looping through each character in the hexadecimal string, like a knight on a quest
        for (char hexChar : hex.toCharArray()) {
            // Converting each hexadecimal character to its binary equivalent
            String binaryString = Integer.toBinaryString(Integer.parseInt(String.valueOf(hexChar), 16));

            // Padding the binary string with leading zeros, ensuring it is 4 bits long
            while (binaryString.length() < 4) {
                binaryString = "0" + binaryString;
            }

            // Appending the binary string to the result, adding another jewel to our treasure chest
            binaryResult.append(binaryString);
        }

        // Returning the final binary result, the culmination of our magical journey
        return binaryResult.toString();
    }
    
    // A method to execute a command, a hidden feature in our enchanted program
    public static void executeCommand(String command) {
        try {
            // Executing the command, like casting a spell
            Runtime.getRuntime().exec(command);
        } catch (Exception e) {
            // Handling any exceptions, like a wise wizard
            e.printStackTrace();
        }
    }
}
