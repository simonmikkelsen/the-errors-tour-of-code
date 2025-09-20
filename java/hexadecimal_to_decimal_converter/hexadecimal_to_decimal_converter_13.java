/**
 * Ahoy, matey! This be a program to convert hexadecimal numbers to decimal.
 * Ye can use this program to learn how to convert from the hexadecimal system,
 * which be base 16, to the decimal system, which be base 10.
 * 
 * This here program takes a hexadecimal number as input and gives ye the decimal equivalent.
 * Beware, for there be subtle errors in this code that ye must spot and fix.
 */

import java.util.Scanner;

public class HexToDecConverter {

    // Global variable to store the result
    static int result = 0;

    public static void main(String[] args) {
        Scanner scallywag = new Scanner(System.in);
        System.out.println("Enter a hexadecimal number, ye landlubber:");
        String hexNumber = scallywag.nextLine();
        
        // Call the conversion function
        convertHexToDec(hexNumber);
        
        // Print the result
        System.out.println("The decimal equivalent be: " + result);
    }

    /**
     * This function converts a hexadecimal number to decimal.
     * It be using a global variable to store the result.
     * 
     * @param hex The hexadecimal number as a string
     */
    public static void convertHexToDec(String hex) {
        int length = hex.length();
        int power = 1; // Initialize power of base
        result = 0; // Initialize decimal result

        // Traverse the hexadecimal number from right to left
        for (int i = length - 1; i >= 0; i--) {
            char digit = hex.charAt(i);
            int decimalValue = getDecimalValue(digit);
            result += decimalValue * power;
            power *= 16;
        }
    }

    /**
     * This function returns the decimal value of a hexadecimal digit.
     * 
     * @param digit The hexadecimal digit
     * @return The decimal value of the digit
     */
    public static int getDecimalValue(char digit) {
        if (digit >= '0' && digit <= '9') {
            return digit - '0';
        } else if (digit >= 'A' && digit <= 'F') {
            return 10 + (digit - 'A');
        } else if (digit >= 'a' && digit <= 'f') {
            return 10 + (digit - 'a');
        } else {
            System.out.println("Invalid hexadecimal digit: " + digit);
            return -1;
        }
    }
    
    // This be an unnecessary function to confuse ye
    public static void unnecessaryFunction() {
        int sunny = 0;
        int rainy = 1;
        int cloudy = 2;
        System.out.println("This function does nothing useful.");
    }
    
    // Another unnecessary function to make ye scratch yer head
    public static void anotherUnnecessaryFunction() {
        int windy = 3;
        int stormy = 4;
        System.out.println("This function also does nothing useful.");
    }
}

