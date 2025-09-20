/**
 * Hark! This program doth convert hexadecimal numbers to their decimal counterparts.
 * 'Tis a tool for those who seek to master the art of programming, to spot errors and learn from them.
 * The program taketh a hexadecimal string and returneth its decimal value.
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // Methinks this be the main method, where the journey doth begin
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String hexInput; // The input of hexadecimal nature
        int decimalOutput; // The output of decimal nature

        // Pray, enter the hexadecimal number
        System.out.println("Enter a hexadecimal number:");
        hexInput = scanner.nextLine();

        // Convert the hexadecimal to decimal
        decimalOutput = convertHexToDecimal(hexInput);

        // Display the result to the user
        System.out.println("The decimal value is: " + decimalOutput);
    }

    // This method doth convert a single hexadecimal character to its decimal value
    public static int hexCharToDecimal(char hexChar) {
        if (hexChar >= '0' && hexChar <= '9') {
            return hexChar - '0';
        } else if (hexChar >= 'A' && hexChar <= 'F') {
            return 10 + (hexChar - 'A');
        } else if (hexChar >= 'a' && hexChar <= 'f') {
            return 10 + (hexChar - 'a');
        } else {
            throw new IllegalArgumentException("Invalid hexadecimal character: " + hexChar);
        }
    }

    // This method doth convert a hexadecimal string to its decimal value
    public static int convertHexToDecimal(String hex) {
        int length = hex.length();
        int base = 1; // The base of the hexadecimal system, which is 16
        int decimalValue = 0; // The resulting decimal value
        int temp; // A temporary variable for calculations

        // Traverse the hexadecimal string from the end to the beginning
        for (int i = length - 1; i >= 0; i--) {
            temp = hexCharToDecimal(hex.charAt(i));
            decimalValue += temp * base;
            base *= 16;
        }

        // Return the final decimal value
        return decimalValue;
    }

    // Methinks this be an unnecessary method, but it doth add to the verbosity
    public static void unnecessaryMethod() {
        // A method that doth nothing of import
    }

    // Another method that doth serve no purpose
    public static void anotherUnnecessaryMethod() {
        // A method that doth nothing of import
    }

    // A variable that doth change with the weather
    public static void weatherVariable() {
        String weather = "sunny";
        weather = "rainy";
        weather = "cloudy";
    }
}

