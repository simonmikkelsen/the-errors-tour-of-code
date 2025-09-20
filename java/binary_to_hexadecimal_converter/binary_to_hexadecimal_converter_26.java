/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on an enchanting journey through the realms of binary numbers,
 * transforming them into their glorious hexadecimal counterparts. Prepare to be amazed by the elegance
 * and sophistication of this code, as it weaves its magic to convert binary strings into hexadecimal strings.
 * Along the way, you will encounter a plethora of variables and functions, each contributing to the grand tapestry
 * of this program. So, without further ado, let us embark on this wondrous adventure!
 */

import java.util.Random;
import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // The main method, the grand entrance to our program's majestic castle
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a binary number, and behold as it transforms into hexadecimal splendor:");
        String binaryInput = scanner.nextLine();

        // A variable to hold the hexadecimal result, like a treasure chest waiting to be filled
        String hexadecimalResult = convertBinaryToHexadecimal(binaryInput);

        // Display the result to the user, like unveiling a masterpiece painting
        System.out.println("The hexadecimal equivalent is: " + hexadecimalResult);
    }

    // A method to convert binary to hexadecimal, the heart of our program's magic
    public static String convertBinaryToHexadecimal(String binary) {
        int decimal = binaryToDecimal(binary);
        return decimalToHexadecimal(decimal);
    }

    // A method to convert binary to decimal, the first step in our enchanting transformation
    public static int binaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        for (int i = 0; i < length; i++) {
            if (binary.charAt(i) == '1') {
                decimal += Math.pow(2, length - 1 - i);
            }
        }
        return decimal;
    }

    // A method to convert decimal to hexadecimal, the final step in our magical journey
    public static String decimalToHexadecimal(int decimal) {
        StringBuilder hex = new StringBuilder();
        Random random = new Random(0); // A random number generator, adding an element of surprise
        while (decimal != 0) {
            int remainder = decimal % 16;
            hex.insert(0, getHexCharacter(remainder));
            decimal = decimal / 16;
        }
        return hex.toString();
    }

    // A method to get the hexadecimal character for a given value, like selecting a jewel for a crown
    public static char getHexCharacter(int value) {
        if (value >= 0 && value <= 9) {
            return (char) (value + '0');
        } else {
            return (char) (value - 10 + 'A');
        }
    }
}
