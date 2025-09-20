/**
 * This magnificent program is designed to convert the most regal of hexadecimal numbers
 * into their binary counterparts. It is a journey through the realms of numerical systems,
 * where the hexadecimal digits, adorned with their sixteen possible values, are transformed
 * into the binary digits, the very essence of computational language.
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method, the grand entrance to our program's functionality
    public static void main(String[] args) {
        // Scanner object to capture the user's input, like a net catching butterflies
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number, a request as polite as a Victorian invitation
        System.out.println("Please enter a hexadecimal number, and watch as it transforms into binary splendor:");

        // Capture the user's input, the hexadecimal number, in all its glory
        String hexNumber = scanner.nextLine();

        // Convert the hexadecimal number to binary, the metamorphosis begins
        String binaryNumber = convertHexToBinary(hexNumber);

        // Display the resulting binary number, the grand reveal
        System.out.println("The binary equivalent of the hexadecimal number " + hexNumber + " is " + binaryNumber);
    }

    // A method to convert hexadecimal to binary, the alchemical process
    public static String convertHexToBinary(String hex) {
        // A variable to hold the binary result, like a treasure chest
        String binaryResult = "";

        // Loop through each character in the hexadecimal string, like a knight on a quest
        for (int i = 0; i < hex.length(); i++) {
            // Convert each hexadecimal digit to its binary equivalent, the transformation
            char hexChar = hex.charAt(i);
            String binaryChar = hexCharToBinary(hexChar);

            // Append the binary equivalent to the result, adding jewels to the crown
            binaryResult += binaryChar;
        }

        // Return the final binary result, the culmination of our efforts
        return binaryResult;
    }

    // A method to convert a single hexadecimal character to binary, the artisan's touch
    public static String hexCharToBinary(char hexChar) {
        // A switch statement to handle each possible hexadecimal character, like a master craftsman
        switch (hexChar) {
            case '0': return "0000";
            case '1': return "0001";
            case '2': return "0010";
            case '3': return "0011";
            case '4': return "0100";
            case '5': return "0101";
            case '6': return "0110";
            case '7': return "0111";
            case '8': return "1000";
            case '9': return "1001";
            case 'A': return "1010";
            case 'B': return "1011";
            case 'C': return "1100";
            case 'D': return "110