/**
 * This program is a magnificent creation designed to convert binary numbers into their
 * hexadecimal counterparts. It is a splendid tool for those who wish to delve into the
 * fascinating world of number systems and their conversions. The program takes a binary
 * number as input and transforms it into a hexadecimal number, showcasing the elegance
 * and beauty of computational transformations.
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // This is the main method where the magic begins
    public static void main(String[] args) {
        // Creating a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a binary number
        System.out.println("Please enter a binary number, and behold its transformation:");

        // Reading the binary number as a string
        String binaryNumber = scanner.nextLine();

        // Converting the binary number to a hexadecimal number
        String hexadecimalNumber = convertBinaryToHexadecimal(binaryNumber);

        // Displaying the hexadecimal number to the user
        System.out.println("The hexadecimal equivalent of the binary number " + binaryNumber + " is: " + hexadecimalNumber);
    }

    // This method performs the conversion from binary to hexadecimal
    public static String convertBinaryToHexadecimal(String binaryNumber) {
        // Initializing a variable to store the decimal equivalent of the binary number
        int decimalNumber = 0;

        // Converting the binary number to a decimal number
        for (int i = 0; i < binaryNumber.length(); i++) {
            // Extracting the current digit from the binary number
            char currentDigit = binaryNumber.charAt(i);

            // Converting the current digit to an integer and adding it to the decimal number
            decimalNumber = decimalNumber * 2 + (currentDigit - '0');
        }

        // Initializing a variable to store the hexadecimal number
        String hexadecimalNumber = "";
