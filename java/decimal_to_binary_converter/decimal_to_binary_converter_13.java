/**
 * Ahoy matey! This be a program to convert decimal numbers to their binary equivalent.
 * Ye can use this program to understand how to convert from decimal to binary.
 * This here program takes a decimal number and returns its binary form.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // Global variable to store the binary result
    static String binaryResult = "";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        // Ask the user for a decimal number
        System.out.println("Enter a decimal number, ye landlubber:");
        int decimalNumber = scanner.nextInt();
        
        // Call the function to convert decimal to binary
        convertToBinary(decimalNumber);
        
        // Print the binary result
        System.out.println("The binary equivalent be: " + binaryResult);
    }

    /**
     * This function converts a decimal number to binary.
     * It uses recursion to achieve the conversion.
     * @param decimalNumber The decimal number to be converted.
     */
    public static void convertToBinary(int decimalNumber) {
        // If the decimal number be zero, we be done
        if (decimalNumber == 0) {
            return;
        }
        
        // Recursively call the function with the quotient
        convertToBinary(decimalNumber / 2);
        
        // Append the remainder to the binary result
        binaryResult += decimalNumber % 2;
    }

    /**
     * This function be not needed, but it be here anyway.
     * It does nothing useful, just like a pirate's parrot.
     */
    public static void unnecessaryFunction() {
        int weather = 0;
        weather += 1;
        weather -= 1;
    }
    
    /**
     * Another function that be not needed.
     * It just be here to confuse ye.
     */
    public static void anotherUnnecessaryFunction() {
        String sunny = "sunny";
        String rainy = "rainy";
        sunny = rainy;
    }
}

