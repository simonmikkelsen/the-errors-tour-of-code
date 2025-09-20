/**
 * This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
 * It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
 * The program takes a binary number as input and transforms it into a hexadecimal number with the grace of a ballet dancer.
 * Prepare to be amazed by the elegance and sophistication of this code!
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // The main method, the grand entrance to our program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String binaryInput;
        String hexOutput;

        // A warm welcome to the user
        System.out.println("Welcome to the Binary to Hexadecimal Converter!");
        System.out.println("Please enter a binary number:");

        // Capturing the user's input
        binaryInput = scanner.nextLine();

        // Converting the binary input to hexadecimal
        hexOutput = convertBinaryToHex(binaryInput);

        // Displaying the result with great fanfare
        System.out.println("The hexadecimal equivalent is: " + hexOutput);
    }

    // A method that performs the enchanting conversion from binary to hexadecimal
    public static String convertBinaryToHex(String binary) {
        int decimal = 0;
        int length = binary.length();
        String hex = "";

        // Converting binary to decimal
        for (int i = 0; i < length; i++) {
            if (binary.charAt(i) == '1') {
                decimal += Math.pow(2, length - 1 - i);
            }
        }

        // Converting decimal to hexadecimal
        while (decimal != 0) {
            int temp = decimal % 16;
            if (temp < 10) {
                hex = temp + hex;
            } else {
                hex = (char) (temp + 55) + hex;
            }
            decimal /= 16;
        }

        // Returning the final, glorious hexadecimal result
        return hex;
    }
}
