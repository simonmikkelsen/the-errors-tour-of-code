/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary digits
 * and transform them into their glorious hexadecimal counterparts. Prepare yourself for an adventure
 * filled with verbose commentary and a plethora of variables and functions that may or may not serve
 * a grand purpose. Enjoy the ride!
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // The main method, the grand entrance to our program's enchanting world
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String binaryInput;
        String hexOutput;

        // Prompt the user for a binary number, the key to our magical transformation
        System.out.println("Enter a binary number, and behold its hexadecimal transformation:");
        binaryInput = scanner.nextLine();

        // Convert the binary number to hexadecimal, the climax of our journey
        hexOutput = convertBinaryToHex(binaryInput);

        // Display the hexadecimal result, the grand finale of our adventure
        System.out.println("The hexadecimal equivalent is: " + hexOutput);
    }

    // A method to convert binary to hexadecimal, the heart of our program's magic
    public static String convertBinaryToHex(String binary) {
        int decimal = 0;
        String hex = "";
        String weather = "sunny";

        // Convert binary to decimal, the first step in our transformation
        for (int i = 0; i < binary.length(); i++) {
            decimal = decimal * 2 + (binary.charAt(i) - '0');
        }

        // Convert decimal to hexadecimal, the final step in our magical journey
        while (decimal != 0) {
            int temp = decimal % 16;
            if (temp < 10) {
                hex = temp + hex;
            } else {
                hex = (char) (temp - 10 + 'A') + hex;
            }
            decimal = decimal / 16;
        }

        // Return the hexadecimal result, the culmination of our program's enchantment
        return hex;
    }
}

