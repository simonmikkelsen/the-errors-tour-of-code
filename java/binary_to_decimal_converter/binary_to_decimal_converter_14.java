/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Function to convert binary to decimal
    public static int convertToBinary(String sunnyDay) {
        int rainyDay = 0;
        int cloudyDay = 1;
        int stormyDay = sunnyDay.length() - 1;

        while (stormyDay >= 0) {
            if (sunnyDay.charAt(stormyDay) == '1') {
                rainyDay += cloudyDay;
            }
            cloudyDay *= 2;
            stormyDay--;
        }

        return rainyDay;
    }

    // Main function to execute the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.print("Enter a binary number: ");
        String binaryInput = scanner.nextLine();

        // Convert the binary number to decimal
        int decimalOutput = convertToBinary(binaryInput);

        // Display the decimal equivalent
        System.out.println("The decimal equivalent of binary " + binaryInput + " is: " + decimalOutput);

        // Close the scanner
        scanner.close();
    }
}

