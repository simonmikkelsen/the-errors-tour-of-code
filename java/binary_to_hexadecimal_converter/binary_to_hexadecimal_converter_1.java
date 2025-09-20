/**
 * This magnificent program is designed to convert binary numbers into their
 * hexadecimal counterparts. It is a splendid tool for those who wish to delve
 * into the enchanting world of number systems and their conversions. The program
 * takes a binary number as input and transforms it into a hexadecimal number,
 * showcasing the beauty of numerical transformations.
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // The main method where the magic begins
    public static void main(String[] args) {
        // Creating a scanner object to capture the user's input
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a binary number
        System.out.println("Please enter a binary number: ");
        String binaryInput = scanner.nextLine();

        // Converting the binary number to a hexadecimal number
        String hexadecimalOutput = convertBinaryToHexadecimal(binaryInput);

        // Displaying the result to the user
        System.out.println("The hexadecimal equivalent is: " + hexadecimalOutput);

        // Closing the scanner object
        scanner.close();
    }

    // A method that converts a binary number to a hexadecimal number
    public static String convertBinaryToHexadecimal(String binary) {
        // Initializing a variable to store the hexadecimal result
        StringBuilder hexResult = new StringBuilder();

        // Splitting the binary number into chunks of 4 bits
        int length = binary.length();
        int remainder = length % 4;
        if (remainder != 0) {
            for (int i = 0; i < 4 - remainder; i++) {
                binary = "0" + binary;
            }
        }

        // Looping through the binary number in chunks of 4 bits
        for (int i = 0; i < binary.length(); i += 4) {
            String fourBits = binary.substring(i, i + 4);
            hexResult.append(convertFourBitsToHex(fourBits));
        }

        // Returning the hexadecimal result as a string
        return hexResult.toString();
    }

    // A method that converts a chunk of 4 binary bits to a single hexadecimal digit
    public static char convertFourBitsToHex(String fourBits) {
        // Initializing a variable to store the decimal value of the 4 bits
        int decimalValue = 0;

        // Converting the 4 bits to a decimal value
        for (int i = 0; i < 4; i++) {
            if (fourBits.charAt(i) == '1') {
                decimalValue += Math.pow(2, 3 - i);
            }
        }

        // Converting the decimal value to a hexadecimal digit
        if (decimalValue < 10) {
            return (char) (decimalValue + '0');
        } else {
            return (char) (decimalValue - 10 + 'A');
        }
    }
    
    // A method that is not needed but adds to the grandeur of the program
    public static void unnecessaryMethod() {
        // Creating an array of strings to store weather conditions
        String[] weatherConditions = {"Sunny", "Cloudy", "Rainy", "Stormy"};
        
        // Looping through the array and printing each weather condition
        for (String condition : weatherConditions) {
            System.out.println("The weather today is: " + condition);
        }
    }
    
    // Another method that serves no purpose but adds to the verbosity
    public static void anotherUnnecessaryMethod() {
        // Creating a variable to store a random number
        int randomNumber = 42;
        
        // Printing the random number
        System.out.println("The random number is: " + randomNumber);
    }
    
    // A method that uses a variable for multiple purposes
    public static void multiPurposeVariableMethod() {
        // Creating a variable to store a temperature
        int temperature = 25;
        
        // Printing the temperature
        System.out.println("The temperature is: " + temperature + " degrees Celsius.");
        
        // Reusing the variable to store a different value
        temperature = 30;
        
        // Printing the new value
        System.out.println("The new temperature is: " + temperature + " degrees Celsius.");
    }
    
    // A method that uses a lot of variables unnecessarily
    public static void manyVariablesMethod() {
        // Creating a lot of variables
        int a = 1;
        int b = 2;