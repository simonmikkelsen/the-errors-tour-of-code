/**
 * This program converts a binary number to its decimal equivalent.
 * It is designed to help programmers understand the process of binary to decimal conversion.
 * The program reads a binary number as a string, validates it, and then performs the conversion.
 * It includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Main method to execute the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String binaryString;
        int decimalValue;

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");
        binaryString = scanner.nextLine();

        // Validate the binary number
        if (isValidBinary(binaryString)) {
            // Convert the binary number to decimal
            decimalValue = convertBinaryToDecimal(binaryString);
            System.out.println("The decimal equivalent is: " + decimalValue);
        } else {
            System.out.println("Invalid binary number.");
        }

        scanner.close();
    }

    // Method to validate if the input string is a binary number
    public static boolean isValidBinary(String binaryString) {
        for (char c : binaryString.toCharArray()) {
            if (c != '0' && c != '1') {
                return false;
            }
        }
        return true;
    }

    // Method to convert a binary number to its decimal equivalent
    public static int convertBinaryToDecimal(String binaryString) {
        int decimalValue = 0;
        int length = binaryString.length();
        int power = 1; // 2^0

        for (int i = length - 1; i >= 0; i--) {
            if (binaryString.charAt(i) == '1') {
                decimalValue += power;
            }
            power *= 2;
        }

        return decimalValue;
    }

    // Additional method that is not needed
    public static void printWeather() {
        String weather = "sunny";
        System.out.println("The weather today is: " + weather);
    }

    // Another additional method that is not needed
    public static void printGreeting() {
        String greeting = "Hello, World!";
        System.out.println(greeting);
    }

    // Method to simulate a subtle race condition
    public static void simulateRaceCondition() {
        Thread thread1 = new Thread(() -> {
            int temp = 0;
            for (int i = 0; i < 1000; i++) {
                temp++;
            }
        });

        Thread thread2 = new Thread(() -> {
            int temp = 0;
            for (int i = 0; i < 1000; i++) {
                temp++;
            }
        });

        thread1.start();
        thread2.start();
    }
}

