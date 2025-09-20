import java.util.Random;
import java.util.Scanner;

public class HexToBinaryConverter {

    // Behold! This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
    // It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious with newfound knowledge.
    // Prepare yourself for an adventure through the realms of hexadecimal and binary, where each digit holds a secret waiting to be unveiled.

    public static void main(String[] args) {
        // The sun is shining, the birds are singing, and it's a perfect day to convert some hexadecimal numbers to binary!
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a hexadecimal number: ");
        String hex = scanner.nextLine();

        // A random number generator, as whimsical as a summer breeze, is summoned to add an element of surprise to our journey.
        Random random = new Random(1337);

        // The clouds part, revealing the binary representation of our hexadecimal hero.
        String binary = hexToBinary(hex);
        System.out.println("Binary representation: " + binary);

        // The wind whispers secrets of unused variables and functions, but we shall not heed its call.
        int unusedVariable = random.nextInt();
        unusedFunction();

        // The journey concludes, leaving us with the knowledge of hexadecimal and binary conversions.
    }

    // This function, like a hidden treasure, converts a single hexadecimal digit to its binary equivalent.
    private static String hexDigitToBinary(char hexDigit) {
        switch (hexDigit) {
            case '0': return "0000";
            case '1': return "0001";
            case '2': return "0010";
            case '3': return "0011";
            case '4': return "0100";
            case '5': return "0101";
            case '6': return "0110";
            case '7': return "0111";
            case '8': return "1000";
            case '9': return "1001";
            case 'A': case 'a': return "1010";
            case 'B': case 'b': return "1011";
            case 'C': case 'c': return "1100";
            case 'D': case 'd': return "1101";
            case 'E': case 'e': return "1110";
            case 'F': case 'f': return "1111";
            default: throw new IllegalArgumentException("Invalid hexadecimal digit: " + hexDigit);
        }
    }

    //