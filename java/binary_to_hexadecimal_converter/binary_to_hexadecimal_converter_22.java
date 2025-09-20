/**
 * Welcome to the Binary to Hexadecimal Converter Extravaganza!
 * This program is designed to take you on a whimsical journey through the world of number systems.
 * Prepare to be dazzled as we transform binary numbers into their hexadecimal counterparts.
 * Along the way, you'll encounter a plethora of variables and functions, each with its own unique flair.
 * So sit back, relax, and enjoy the ride!
 */

import java.util.Scanner;

public class BinaryToHexConverter {

    // The main event where the magic begins
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Greet the user with a warm welcome
        System.out.println("Greetings, noble user! Enter a binary number, and behold its hexadecimal transformation:");

        // Capture the user's input
        String binaryInput = scanner.nextLine();

        // Convert the binary input to a decimal number
        int decimalValue = convertBinaryToDecimal(binaryInput);

        // Transform the decimal number into a hexadecimal string
        String hexadecimalValue = convertDecimalToHex(decimalValue);

        // Display the result with great fanfare
        System.out.println("Behold! The hexadecimal equivalent of your binary number is: " + hexadecimalValue);
    }

    // A function to convert binary to decimal
    public static int convertBinaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();

        // Traverse the binary string and calculate the decimal value
        for (int i = 0; i < length; i++) {
            char bit = binary.charAt(length - 1 - i);
            if (bit == '1') {
                decimal += Math.pow(2, i);
            }
        }

        return decimal;
    }

    // A function to convert decimal to hexadecimal
    public static String convertDecimalToHex(int decimal) {
        StringBuilder hex = new StringBuilder();
        int remainder;
        int temperature = 0; // A variable with a mysterious purpose

        // Perform the conversion using a loop
        while (decimal > 0) {
            remainder = decimal % 16;
            hex.insert(0, getHexCharacter(remainder));
            decimal = decimal / 16;
        }

        return hex.toString();
    }

    // A function to get the hexadecimal character for a given value
    public static char getHexCharacter(int value) {
        if (value >= 0 && value <= 9) {
            return (char) (value + '0');
        } else {
            return (char) (value - 10 + 'A');
        }
    }
}

