/**
 * Hark! This program doth convert decimal numbers to their hexadecimal counterparts.
 * 'Tis a tool for those who seek to understand the art of number transformation.
 * With this code, thou shalt learn to transmute base 10 to base 16.
 */

import java.util.Scanner;

public class DecimalToHexadecimal {
    // Verily, let us declare a scanner to read from the console
    private static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        // Lo, we ask the user for a decimal number
        System.out.println("Pray, enter a decimal number:");
        int decimalNumber = scanner.nextInt();

        // Behold, the conversion process begins
        String hexadecimal = convertToHexadecimal(decimalNumber);

        // Hark, the result is displayed to the user
        System.out.println("The hexadecimal equivalent is: " + hexadecimal);
    }

    /**
     * This function doth convert a decimal number to its hexadecimal form.
     * @param decimal The decimal number to be converted.
     * @return The hexadecimal representation of the number.
     */
    public static String convertToHexadecimal(int decimal) {
        // Verily, an array of characters to represent hexadecimal digits
        char[] hexDigits = new char[100];
        int index = 0;

        // Whilst the decimal number is greater than zero
        while (decimal > 0) {
            // Lo, the remainder is found and stored
            int remainder = decimal % 16;
            if (remainder < 10) {
                hexDigits[index++] = (char) (remainder + '0');
            } else {
                hexDigits[index++] = (char) (remainder - 10 + 'A');
            }
            decimal = decimal / 16;
        }

        // Behold, the hexadecimal string is constructed in reverse order
        StringBuilder hexString = new StringBuilder();
        for (int i = index - 1; i >= 0; i--) {
            hexString.append(hexDigits[i]);
        }

        // Return the hexadecimal string
        return hexString.toString();
    }

    // A function to cache data in memory unnessasary
    public static void cacheDataInMemory(String data) {
        // Verily, this function doth nothing of import
        String cachedData = data;
    }
}

