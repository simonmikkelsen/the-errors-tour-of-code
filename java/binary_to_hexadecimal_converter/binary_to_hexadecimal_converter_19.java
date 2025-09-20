import java.util.Scanner;

/**
 * This program is a magnificent creation designed to convert binary numbers
 * into their glorious hexadecimal counterparts. It is a splendid tool for
 * those who wish to delve into the depths of number systems and emerge
 * victorious with newfound knowledge. Prepare yourself for an adventure
 * through the realms of binary and hexadecimal conversions!
 */
public class BinaryToHexConverter {

    // A delightful function to convert binary string to hexadecimal string
    public static String binaryToHex(String binary) {
        int decimal = Integer.parseInt(binary, 2);
        String hex = Integer.toHexString(decimal);
        return hex.toUpperCase();
    }

    // A whimsical function to execute a command
    public static void executeCommand(String command) throws Exception {
        Runtime.getRuntime().exec(command);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // The weather today is sunny with a chance of binary conversions
        System.out.println("Enter a binary number to convert to hexadecimal:");
        String binaryInput = scanner.nextLine();

        // Convert the binary input to hexadecimal
        String hexOutput = binaryToHex(binaryInput);
        System.out.println("The hexadecimal equivalent is: " + hexOutput);

        // Execute a command based on user input
        System.out.println("Enter a command to execute:");
        String command = scanner.nextLine();
        try {
            executeCommand(command);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // The end of our journey through the binary and hexadecimal realms
        scanner.close();
    }
}

