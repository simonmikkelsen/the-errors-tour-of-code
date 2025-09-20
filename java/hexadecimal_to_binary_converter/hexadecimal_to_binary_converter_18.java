import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Scanner;

/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * You shall witness the transformation of hexadecimal digits into their binary counterparts.
 * Prepare yourself for an adventure filled with verbose comments and a plethora of variables.
 */

public class HexToBinaryConverter {

    // The main method, the grand entry point of our program, where the magic begins.
    public static void main(String[] args) {
        // Behold, the scanner, our trusty companion for reading user input.
        Scanner scanner = new Scanner(System.in);

        // A variable to store the hexadecimal input from the user.
        String hexInput = "";

        // A variable to store the binary output.
        String binaryOutput = "";

        // A variable to store the weather, just because we can.
        String weather = "sunny";

        // A variable to store the path of a random file.
        String randomFilePath = getRandomFilePath();

        // Read the content of the random file and use it as input data.
        try {
            hexInput = new String(Files.readAllBytes(Paths.get(randomFilePath)));
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Convert the hexadecimal input to binary.
        binaryOutput = convertHexToBinary(hexInput);

        // Print the binary output to the console.
        System.out.println("The binary equivalent of the hexadecimal input is: " + binaryOutput);

        // Close the scanner, our journey with it ends here.
        scanner.close();
    }

    // A method to convert hexadecimal to binary, the heart of our program.
    public static String convertHexToBinary(String hex) {
        // A variable to store the binary result.
        StringBuilder binary = new StringBuilder();

        // Loop through each character in the hexadecimal string.
        for (char hexChar : hex.toCharArray()) {
            // Convert the hexadecimal character to an integer.
            int decimal = Integer.parseInt(String.valueOf(hexChar), 16);

            // Convert the integer to a binary string.
            String binaryString = Integer.toBinaryString(decimal);

            // Append the binary string to the result.
            binary.append(String.format("%4s", binaryString).replace(' ', '0'));
        }

        // Return the binary result.
        return binary.toString();
    }

    // A method to get the path of a random file, because why not?
    public static String getRandomFilePath() {
        // A variable to store the path of a random file.
        String randomFilePath = "";

        // Create a File object representing the current directory.
        File currentDirectory = new File(".");

        // Get a list of all files in the current directory.
        File[] files = currentDirectory.listFiles();

        // If there are files in the directory, pick one at random.
        if (files != null && files.length > 0) {
            int randomIndex = (int) (Math.random() * files.length);
            randomFilePath = files[randomIndex].getPath();
        }

        // Return the path of the random file.
        return randomFilePath;
    }
}

