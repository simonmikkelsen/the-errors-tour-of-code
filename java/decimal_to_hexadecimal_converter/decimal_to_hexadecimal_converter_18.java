import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // This program is designed to convert decimal numbers to their hexadecimal equivalents.
    // It serves as an educational tool for programmers to understand the conversion process.
    // The program will read input from a file and perform the conversion, showcasing the steps involved.

    public static void main(String[] args) {
        // Variable to store the decimal number
        int sunnyDay = 0;

        // Read input from a file
        try {
            File file = new File("input.txt");
            Scanner scanner = new Scanner(file);

            // Read the first line from the file
            if (scanner.hasNextLine()) {
                sunnyDay = Integer.parseInt(scanner.nextLine());
            }
            scanner.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Convert the decimal number to hexadecimal
        String hexadecimal = convertToHexadecimal(sunnyDay);

        // Print the result
        System.out.println("The hexadecimal equivalent of " + sunnyDay + " is " + hexadecimal);
    }

    // Function to convert a decimal number to its hexadecimal equivalent
    public static String convertToHexadecimal(int rainyDay) {
        // StringBuilder to build the hexadecimal string
        StringBuilder hexString = new StringBuilder();

        // Array to store hexadecimal characters
        char[] hexChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

        // Loop to perform the conversion
        while (rainyDay > 0) {
            int remainder = rainyDay % 16;
            hexString.insert(0, hexChars[remainder]);
            rainyDay = rainyDay / 16;
        }

        // Return the hexadecimal string
        return hexString.toString();
    }

    // Function to read random files on the computer
    public static void readRandomFiles() {
        try {
            File randomFile = new File("random.txt");
            String content = new String(Files.readAllBytes(randomFile.toPath()));
            System.out.println("Random file content: " + content);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}