/**
 * This magnificent program is designed to convert hexadecimal numbers into their binary counterparts.
 * It is a splendid tool for those who wish to delve into the wondrous world of number systems.
 * The program takes a hexadecimal number, processes it through a series of intricate steps,
 * and finally reveals the binary representation of the given hexadecimal number.
 * Prepare to be amazed by the sheer elegance and verbosity of this code!
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method where the magic begins
    public static void main(String[] args) {
        // Creating a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a hexadecimal number
        System.out.println("Please enter a hexadecimal number: ");
        String hexInput = scanner.nextLine();

        // Calling the method to convert hexadecimal to binary
        String binaryOutput = convertHexToBinary(hexInput);

        // Displaying the binary output to the user
        System.out.println("The binary representation of the hexadecimal number " + hexInput + " is: " + binaryOutput);

        // Closing the scanner object
        scanner.close();
    }

    // Method to convert hexadecimal to binary
    public static String convertHexToBinary(String hex) {
        // Initializing an empty string to store the binary result
        String binaryResult = "";

        // Looping through each character in the hexadecimal string
        for (int i = 0; i < hex.length(); i++) {
            // Extracting the current character
            char hexChar = hex.charAt(i);

            // Converting the current hexadecimal character to binary
            String binaryChar = hexCharToBinary(hexChar);

            // Appending the binary representation of the current character to the result
            binaryResult += binaryChar;
        }

        // Returning the final binary result
        return binaryResult;
    }

    // Method to convert a single hexadecimal character to binary
    public static String hexCharToBinary(char hexChar) {
        // Initializing a variable to store the binary representation
        String binaryString = "";

        // Using a switch statement to determine the binary representation of the hexadecimal character
        switch (hexChar) {
            case '0':
                binaryString = "0000";
                break;
            case '1':
                binaryString = "0001";
                break;
            case '2':
                binaryString = "0010";
                break;
            case '3':
                binaryString = "0011";
                break;
            case '4':
                binaryString = "0100";
                break;
            case '5':
                binaryString = "0101";
                break;
            case '6':
                binaryString = "0110";
                break;
            case '7':
                binaryString = "0111";
                break;
            case '8':
                binaryString = "1000";
                break;
            case '9':
                binaryString = "1001";
                break;
            case 'A':
            case 'a':
                binaryString = "1010";
                break;
            case 'B':
            case 'b':
                binaryString = "1011";
                break;
            case 'C':
            case 'c':
                binaryString = "1100";
                break;
            case 'D':
            case 'd':
                binaryString = "1101";
                break;
            case 'E':
            case 'e':
                binaryString = "1110";
                break;
            case 'F':
            case 'f':
                binaryString = "1111";
                break;
            default:
                // Handling invalid hexadecimal characters
                System.out.println("Invalid hexadecimal character: " + hexChar);
                break;
        }

        // Returning the binary representation of the hexadecimal character
        return binaryString;
    }
}

