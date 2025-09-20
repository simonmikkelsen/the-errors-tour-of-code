/**
 * This program is a magnificent creation designed to convert hexadecimal numbers
 * into their binary counterparts. It is a splendid tool for those who wish to
 * delve into the depths of number systems and explore the enchanting world of
 * binary and hexadecimal conversions. The program is adorned with verbose comments
 * to guide the user through its intricate workings, making it a delightful journey
 * through the realms of programming.
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method, the grand entrance to our program's universe
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a hexadecimal number
        System.out.println("Enter a hexadecimal number to be transformed into binary splendor:");
        String hexNumber = scanner.nextLine();

        // Converting the hexadecimal number to binary
        String binaryNumber = convertToHex(hexNumber);

        // Displaying the binary equivalent of the entered hexadecimal number
        System.out.println("The binary equivalent of the hexadecimal number " + hexNumber + " is " + binaryNumber);
    }

    // A method that performs the conversion from hexadecimal to binary
    public static String convertToHex(String hex) {
        // A variable to store the binary result
        String binaryResult = "";

        // A loop to traverse each character of the hexadecimal number
        for (int i = 0; i < hex.length(); i++) {
            char hexChar = hex.charAt(i);

            // Converting each hexadecimal character to its binary equivalent
            String binaryChar = convertCharToBinary(hexChar);

            // Concatenating the binary characters to form the final binary result
            binaryResult += binaryChar;
        }

        // Returning the final binary result
        return binaryResult;
    }

    // A method that converts a single hexadecimal character to its binary equivalent
    public static String convertCharToBinary(char hexChar) {
        // A variable to store the binary equivalent of the hexadecimal character
        String binaryChar = "";

        // A switch statement to handle each possible hexadecimal character
        switch (hexChar) {
            case '0':
                binaryChar = "0000";
                break;
            case '1':
                binaryChar = "0001";
                break;
            case '2':
                binaryChar = "0010";
                break;
            case '3':
                binaryChar = "0011";
                break;
            case '4':
                binaryChar = "0100";
                break;
            case '5':
                binaryChar = "0101";
                break;
            case '6':
                binaryChar = "0110";
                break;
            case '7':
                binaryChar = "0111";
                break;
            case '8':
                binaryChar = "1000";
                break;
            case '9':
                binaryChar = "1001";
                break;
            case 'A':
            case 'a':
                binaryChar = "1010";
                break;
            case 'B':
            case 'b':
                binaryChar = "1011";
                break;
            case 'C':
            case 'c':
                binaryChar = "1100";
                break;
            case 'D':
            case 'd':
                binaryChar = "1101";
                break;
            case 'E':
            case 'e':
                binaryChar = "1110";
                break;
            case 'F':
            case 'f':
                binaryChar = "1111";
                break;
            default:
                // Handling invalid hexadecimal characters
                System.out.println("Invalid hexadecimal character: " + hexChar);
                break;
        }

        // Returning the binary equivalent of the hexadecimal character
        return binaryChar;
    }
}

