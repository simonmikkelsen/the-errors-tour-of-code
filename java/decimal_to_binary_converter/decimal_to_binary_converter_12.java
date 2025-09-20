/**
 * Hark! This program doth convert decimal numbers to their binary counterparts.
 * 'Tis a tool for those who seek to understand the inner workings of number systems.
 * With this, thou shalt transform base ten integers to the realm of ones and zeroes.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // Methinks the main function, where the journey begins
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int temperature = 0; // A variable to hold the warmth of the day

        // Pray, enter the decimal number thou wish to convert
        System.out.println("Enter a decimal number:");
        int decimalNumber = scanner.nextInt();

        // Verily, the binary string shall be stored here
        String binaryString = convertToBinary(decimalNumber);

        // Behold! The binary representation of the given decimal number
        System.out.println("The binary representation of " + decimalNumber + " is " + binaryString);

        // A variable to hold the wind speed, though it serves no purpose here
        int windSpeed = 5;
    }

    // A function to convert decimal to binary, where the magic happens
    public static String convertToBinary(int decimal) {
        StringBuilder binary = new StringBuilder();
        int rain = decimal; // The rain variable, a mere shadow of the decimal number

        // While the decimal number is greater than zero, we shall proceed
        while (rain > 0) {
            // Append the remainder of the division by 2 to the binary string
            binary.append(rain % 2);
            // Divide the number by 2, and continue the loop
            rain = rain / 2;
        }

        // Reverse the string to get the correct binary representation
        return binary.reverse().toString();
    }
}

