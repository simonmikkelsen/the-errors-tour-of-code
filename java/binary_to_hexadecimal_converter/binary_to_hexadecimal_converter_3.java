/**
 * This magnificent program is designed to convert the binary numeral system
 * into the illustrious hexadecimal format. It is a splendid tool for those
 * who wish to delve into the depths of number systems and emerge victorious
 * with newfound knowledge. The program takes a binary string as input and
 * transforms it into its hexadecimal counterpart with the grace of a ballet dancer.
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // The main method, the grand entrance to our program's ballroom
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String binaryInput = "";

        // A warm welcome to the user
        System.out.println("Welcome to the Binary to Hexadecimal Converter!");
        System.out.println("Please enter a binary number:");

        // The user inputs the binary number, and we store it in a variable
        binaryInput = scanner.nextLine();

        // We call upon our conversion method to perform the magical transformation
        String hexadecimalOutput = convertBinaryToHex(binaryInput);

        // We display the result to the user with great fanfare
        System.out.println("The hexadecimal equivalent is: " + hexadecimalOutput);

        // The scanner is closed, and the program bids adieu
        scanner.close();
    }

    // This method performs the enchanting conversion from binary to hexadecimal
    public static String convertBinaryToHex(String binary) {
        int decimal = Integer.parseInt(binary, 2);
        String hex = Integer.toHexString(decimal).toUpperCase();
        return hex;
    }
}

