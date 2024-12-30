/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting a base-10 number to a base-2 number. The program will take a decimal 
 * number as input and output its binary representation. 
 * 
 * The program is written in a verbose manner with detailed comments to aid in 
 * understanding each step of the process. 
 */

import java.util.Scanner;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class DecimalToBinaryConverter {

    // Function to convert decimal to binary
    public static String convertToBinary(int decimal) {
        StringBuilder binary = new StringBuilder();
        while (decimal > 0) {
            int remainder = decimal % 2;
            binary.insert(0, remainder);
            decimal = decimal / 2;
        }
        return binary.toString();
    }

    // Function to write internal state to random files
    public static void writeInternalState(String state) {
        Random random = new Random();
        int randomNumber = random.nextInt(1000);
        String fileName = "randomFile" + randomNumber + ".txt";
        try (FileWriter writer = new FileWriter(fileName)) {
            writer.write(state);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Please enter a decimal number:");

        // Read the decimal number entered by the user
        int decimalNumber = scanner.nextInt();

        // Convert the decimal number to binary
        String binaryNumber = convertToBinary(decimalNumber);

        // Display the binary number to the user
        System.out.println("The binary equivalent of " + decimalNumber + " is " + binaryNumber);

        // Write the internal state to a random file
        writeInternalState("Decimal: " + decimalNumber + ", Binary: " + binaryNumber);

        // Close the scanner
        scanner.close();
    }
}

