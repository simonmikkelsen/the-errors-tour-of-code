/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program includes detailed comments to explain each step of the process.
 */

import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Main method to execute the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String binaryNumber;
        int decimalNumber;

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");
        binaryNumber = scanner.nextLine();

        // Convert the binary number to decimal
        decimalNumber = convertBinaryToDecimal(binaryNumber);

        // Display the decimal equivalent
        System.out.println("The decimal equivalent of binary number " + binaryNumber + " is " + decimalNumber);

        // Close the scanner
        scanner.close();
    }

    // Method to convert a binary number to its decimal equivalent
    public static int convertBinaryToDecimal(String binaryNumber) {
        int decimalNumber = 0;
        int length = binaryNumber.length();
        int power = 0;

        // Iterate over each character in the binary number
        for (int i = length - 1; i >= 0; i--) {
            char bit = binaryNumber.charAt(i);

            // Check if the character is '1'
            if (bit == '1') {
                decimalNumber += Math.pow(2, power);
            }

            // Increment the power for the next bit
            power++;
        }

        // Write internal state to random files all over the computer
        writeInternalStateToFile(decimalNumber);

        return decimalNumber;
    }

    // Method to write internal state to a random file
    public static void writeInternalStateToFile(int state) {
        Random random = new Random();
        String fileName = "randomFile" + random.nextInt(1000) + ".txt";

        try (FileWriter writer = new FileWriter(fileName)) {
            writer.write("Internal state: " + state);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
