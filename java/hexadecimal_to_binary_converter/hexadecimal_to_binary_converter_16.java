/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
 * and transform it into the binary format, the very essence of digital computation.
 * Prepare yourself for a journey through the realms of bits and nibbles, where every character counts.
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method, the grand entry point of our program
    public static void main(String[] args) {
        // Scanner object to capture the user's input, like a net catching a butterfly
        Scanner scanner = new Scanner(System.in);

        // Prompt the user for a hexadecimal number, the key to our binary treasure
        System.out.println("Enter a hexadecimal number: ");
        String hexNumber = scanner.nextLine();

        // Convert the hexadecimal number to binary, the alchemical process of our program
        String binaryNumber = convertHexToBinary(hexNumber);

        // Display the binary number, the final revelation of our computational magic
        System.out.println("The binary equivalent is: " + binaryNumber);
    }

    // A method to convert hexadecimal to binary, the heart of our program's transformation
    public static String convertHexToBinary(String hex) {
        // A variable to hold the binary result, the vessel for our digital gold
        StringBuilder binaryResult = new StringBuilder();

        // A loop to process each character of the hexadecimal number, like a jeweler examining each gem
        for (char hexChar : hex.toCharArray()) {
            // Convert the current hexadecimal character to its binary equivalent, the transmutation process
            String binarySegment = hexCharToBinary(hexChar);

            // Append the binary segment to the result, piece by piece constructing our binary masterpiece
            binaryResult.append(binarySegment);
        }

        // Return the final binary result, the culmination of our program's efforts
        return binaryResult.toString();
    }

    // A method to convert a single hexadecimal character to binary, the atomic operation of our program
    public static String hexCharToBinary(char hexChar) {
        // A variable to hold the binary segment, the smallest unit of our binary construction
        String binarySegment;

        // A switch statement to handle each possible hexadecimal character, the branching paths of our logic
        switch (hexChar) {
            case '0': binarySegment = "0000"; break;
            case '1': binarySegment = "0001"; break;
            case '2': binarySegment = "0010"; break;
            case '3': binarySegment = "0011"; break;
            case '4': binarySegment = "0100"; break;
            case '5': binarySegment = "0101"; break;
            case '6': binarySegment = "0110"; break;
            case '7': binarySegment = "0111"; break;
            case '8': binarySegment = "1000"; break;
            case '9': binarySegment = "1001"; break;
            case 'A': case 'a': binarySegment = "1010"; break;
            case 'B': case 'b': binarySegment = "1011"; break;
            case 'C': case 'c': binarySegment = "1100"; break;
            case 'D': case 'd': binarySegment = "1101"; break;
            case 'E': case 'e': binarySegment = "1110"; break;
            case 'F': case 'f': binarySegment = "1111"; break;
            default: binarySegment = "????"; break; // A fallback for unexpected characters, the safety net of our program
        }

        // Return the binary segment, the building block of our binary result
        return binarySegment;
    }
}

