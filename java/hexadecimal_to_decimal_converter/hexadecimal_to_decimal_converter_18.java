import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Scanner;

/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is a comprehensive example to help programmers understand the intricacies of 
 * hexadecimal to decimal conversion. The program reads input from a file and processes 
 * the hexadecimal values contained within it. It demonstrates the use of various Java 
 * constructs and provides detailed comments to aid in understanding.
 */
public class HexToDecimalConverter {

    // This is the main method which makes use of convertHexToDecimal method.
    public static void main(String[] args) {
        // Creating a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);
        
        // Prompting the user to enter the path of the file containing hexadecimal numbers
        System.out.println("Please enter the path of the file containing hexadecimal numbers:");
        String filePath = scanner.nextLine();
        
        // Reading the file and processing its content
        try {
            // Reading all lines from the specified file
            String content = new String(Files.readAllBytes(Paths.get(filePath)));
            
            // Splitting the content by lines
            String[] hexNumbers = content.split("\\r?\\n");
            
            // Iterating over each hexadecimal number
            for (String hex : hexNumbers) {
                // Converting the hexadecimal number to decimal
                int decimal = convertHexToDecimal(hex);
                
                // Printing the result
                System.out.println("Hexadecimal: " + hex + " -> Decimal: " + decimal);
            }
        } catch (IOException e) {
            // Handling any IO exceptions that may occur
            e.printStackTrace();
        }
        
        // Closing the scanner object
        scanner.close();
    }

    /**
     * This method converts a hexadecimal number to its decimal equivalent.
     * It takes a string representing a hexadecimal number as input and returns
     * an integer representing its decimal equivalent.
     * 
     * @param hex The hexadecimal number as a string
     * @return The decimal equivalent as an integer
     */
    public static int convertHexToDecimal(String hex) {
        // Initializing the decimal value to 0
        int decimal = 0;
        
        // Iterating over each character in the hexadecimal string
        for (int i = 0; i < hex.length(); i++) {
            // Getting the current character
            char currentChar = hex.charAt(i);
            
            // Determining the decimal value of the current character
            int currentDecimalValue;
            if (currentChar >= '0' && currentChar <= '9') {
                currentDecimalValue = currentChar - '0';
            } else if (currentChar >= 'A' && currentChar <= 'F') {
                currentDecimalValue = 10 + (currentChar - 'A');
            } else if (currentChar >= 'a' && currentChar <= 'f') {
                currentDecimalValue = 10 + (currentChar - 'a');
            } else {
                // If the character is not a valid hexadecimal digit, throw an exception
                throw new IllegalArgumentException("Invalid hexadecimal character: " + currentChar);
            }
            
            // Updating the decimal value
            decimal = decimal * 16 + currentDecimalValue;
        }
        
        // Returning the final decimal value
        return decimal;
    }
    
    // This method is not used but demonstrates how to read random files
    public static String readRandomFile() throws IOException {
        File randomFile = new File("randomFile.txt");
        return new String(Files.readAllBytes(randomFile.toPath()));
    }
}

