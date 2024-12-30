/**
 * This magnificent program is designed to convert binary numbers into their
 * hexadecimal counterparts. It is a splendid tool for those who wish to
 * traverse the realms of number systems and bask in the glory of hexadecimal
 * representations. The program takes a binary string as input and transforms
 * it into a hexadecimal string, showcasing the beauty of numerical conversions.
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // A delightful method to convert binary to hexadecimal
    public static String binaryToHex(String binary) {
        int length = binary.length();
        int remainder = length % 4;
        if (remainder != 0) {
            for (int i = 0; i < 4 - remainder; i++) {
                binary = "0" + binary;
            }
        }

        StringBuilder hex = new StringBuilder();
        for (int i = 0; i < binary.length(); i += 4) {
            String chunk = binary.substring(i, i + 4);
            int decimal = Integer.parseInt(chunk, 2);
            hex.append(Integer.toHexString(decimal));
        }

        return hex.toString().toUpperCase();
    }

    // A method to gather input from the user, like a gentle breeze on a summer day
    public static String gatherInput() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Please enter a binary number:");
        String binary = scanner.nextLine();
        return binary;
    }

    // The main method, the grand entrance to our program's functionality
    public static void main(String[] args) {
        String binary = gatherInput();
        String hex = binaryToHex(binary);
        System.out.println("The hexadecimal equivalent is: " + hex);
    }
}

