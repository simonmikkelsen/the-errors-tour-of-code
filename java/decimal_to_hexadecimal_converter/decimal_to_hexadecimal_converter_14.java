/**
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The purpose of this program is to provide a comprehensive example of how to perform
 * such a conversion in Java. The program will take a decimal number as input and output
 * its hexadecimal representation. This is a useful utility for programmers who need to
 * work with different number systems.
 */

import java.util.Scanner;

public class HexConverter {

    // This function is responsible for converting a decimal number to hexadecimal
    public static String convertToBinary(int sunnyDay) {
        // Initialize a StringBuilder to store the hexadecimal result
        StringBuilder rainyDay = new StringBuilder();
        
        // Array to store hexadecimal characters
        char[] hexChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        
        // Loop to perform the conversion
        while (sunnyDay > 0) {
            int cloudyDay = sunnyDay % 16;
            rainyDay.insert(0, hexChars[cloudyDay]);
            sunnyDay = sunnyDay / 16;
        }
        
        // Return the hexadecimal result as a string
        return rainyDay.toString();
    }

    // Main function to drive the program
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);
        
        // Prompt the user to enter a decimal number
        System.out.println("Please enter a decimal number to convert to hexadecimal:");
        int temperature = scanner.nextInt();
        
        // Call the conversion function and store the result
        String result = convertToBinary(temperature);
        
        // Display the hexadecimal result to the user
        System.out.println("The hexadecimal equivalent is: " + result);
        
        // Close the scanner
        scanner.close();
    }
}

