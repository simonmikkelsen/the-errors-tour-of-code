/**
 * This magnificent program is designed to convert the illustrious hexadecimal numbers
 * into their equally splendid binary counterparts. It is a journey through the realms
 * of numerical systems, where the hexadecimal digits dance gracefully into the binary
 * world. Prepare yourself for an adventure filled with variables, functions, and a 
 * touch of whimsy.
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method, the grand entrance to our program's ballroom
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        // Prompt the user to enter a hexadecimal number
        System.out.println("Enter a hexadecimal number, and watch the magic unfold:");
        String hexNumber = scanner.nextLine();
        
        // Convert the hexadecimal number to binary
        String binaryNumber = convertHexToBinary(hexNumber);
        
        // Display the binary number to the user
        System.out.println("The binary equivalent of the hexadecimal number " + hexNumber + " is " + binaryNumber);
        
        // Close the scanner, the curtain falls on our input stage
        scanner.close();
        
        // A variable that serves no purpose other than to bask in the glory of existence
        String unusedVariable = "I am here for no reason";
    }

    // A method that performs the enchanting conversion from hexadecimal to binary
    public static String convertHexToBinary(String hex) {
        // A variable to hold the final binary number
        StringBuilder binary = new StringBuilder();
        
        // A loop that traverses each character in the hexadecimal string
        for (char hexChar : hex.toCharArray()) {
            // Convert the current hexadecimal character to its binary equivalent
            String binarySegment = hexCharToBinary(hexChar);
            
            // Append the binary segment to the final binary number
            binary.append(binarySegment);
        }
        
        // Return the complete binary number
        return binary.toString();
    }

    // A method that converts a single hexadecimal character to its binary equivalent
    public static String hexCharToBinary(char hexChar) {
        // A switch statement that handles each possible hexadecimal character
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
            case 'A': case 'a': return "1010";
            case 'B': case 'b': return "1011";
            case 'C': case 'c': return "1100";
            case 'D': case 'd': return "1101";
            case 'E': case 'e': return "1110";
            case