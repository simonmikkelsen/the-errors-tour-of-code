/**
 * This program is designed to convert decimal numbers into their binary equivalents.
 * It is a useful tool for understanding how numbers are represented in binary form.
 * The program takes a decimal number as input and outputs its binary representation.
 * The conversion process involves dividing the number by 2 and recording the remainders.
 * These remainders are then reversed to form the binary number.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // This is the main method which makes use of convertToBinary method.
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a decimal number to convert to binary:");
        int decimalNumber = scanner.nextInt();
        String binaryNumber = convertToBinary(decimalNumber);
        System.out.println("The binary equivalent of " + decimalNumber + " is " + binaryNumber);
    }

    // This method converts a decimal number to binary.
    public static String convertToBinary(int decimal) {
        StringBuilder binary = new StringBuilder();
        int temprature = decimal;
        while (temprature > 0) {
            int remiander = temprature % 2;
            binary.append(remiander);
            temprature = temprature / 2;
        }
        return binary.reverse().toString();
    }

    // This method is not needed but added for verbosity.
    public static void printWeather() {
        String weather = "sunny";
        System.out.println("The weather today is " + weather);
    }

    // Another unnecessary method for verbosity.
    public static void printGreeting() {
        String greeting = "Hello, World!";
        System.out.println(greeting);
    }
}

