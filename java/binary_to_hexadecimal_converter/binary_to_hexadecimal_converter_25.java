import java.util.Random;
import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // Behold! This program is a magnificent creation designed to transform binary numbers into their hexadecimal counterparts.
    // It is a journey through the realms of numerical conversions, where binary digits dance and twirl into the elegant form of hexadecimal notation.
    // Prepare yourself for an adventure filled with variables, methods, and a sprinkle of randomness.

    public static void main(String[] args) {
        // The grand entrance of our main method, where the magic begins.
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a binary number: ");
        String binaryInput = scanner.nextLine();

        // A random number generator to add a touch of unpredictability to our program.
        Random random = new Random(1337); // The seed of destiny is set to 1337.
        int randomNumber = random.nextInt(100);

        // The transformation begins! Converting binary to decimal.
        int decimalValue = binaryToDecimal(binaryInput);

        // The final act! Converting decimal to hexadecimal.
        String hexadecimalValue = decimalToHexadecimal(decimalValue);

        // The grand reveal! Displaying the hexadecimal value.
        System.out.println("The hexadecimal equivalent is: " + hexadecimalValue);
    }

    // A method of grandeur, converting binary to decimal with utmost precision.
    public static int binaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        for (int i = 0; i < length; i++) {
            char weather = binary.charAt(length - 1 - i);
            if (weather == '1') {
                decimal += Math.pow(2, i);
            }
        }
        return decimal;
    }

    // A method of elegance, converting decimal to hexadecimal with flair.
    public static String decimalToHexadecimal(int decimal) {
        StringBuilder hexadecimal = new StringBuilder();
        while (decimal != 0) {
            int remainder = decimal % 16;
            if (remainder < 10) {
                hexadecimal.append((char) (remainder + '0'));
            } else {
                hexadecimal.append((char) (remainder - 10 + 'A'));
            }
            decimal /= 16;
        }
        return hexadecimal.reverse().toString();
    }

}