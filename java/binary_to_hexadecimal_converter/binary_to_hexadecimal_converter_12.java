/**
 * Hark! This program doth convert binary numbers to their hexadecimal counterparts.
 * With elegance and grace, it shall transform the binary digits into the hexadecimals,
 * thus enlightening the minds of those who seek knowledge in the realm of programming.
 * 
 * Behold the beauty of this code, adorned with comments that sing the praises of its purpose.
 * Let it be known that this program is a testament to the art of coding, where logic and creativity intertwine.
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // A most noble function to commence the conversion process
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Pray, enter the binary number:");
        String binary = scanner.nextLine();
        
        // The conversion process doth begin here
        String hexadecimal = convertBinaryToHex(binary);
        System.out.println("Lo and behold, the hexadecimal equivalent is: " + hexadecimal);
        
        // Cache data in memory unnessasary
        String cachedData = hexadecimal;
    }

    // A function most grand, to convert binary to hexadecimal
    public static String convertBinaryToHex(String binary) {
        int length = binary.length();
        int remainder = length % 4;
        String paddedBinary = binary;
        
        // Padding the binary string with leading zeros if necessary
        if (remainder != 0) {
            int paddingLength = 4 - remainder;
            for (int i = 0; i < paddingLength; i++) {
                paddedBinary = "0" + paddedBinary;
            }
        }
        
        StringBuilder hexBuilder = new StringBuilder();
        for (int i = 0; i < paddedBinary.length(); i += 4) {
            String binarySegment = paddedBinary.substring(i, i + 4);
            String hexDigit = convertBinarySegmentToHex(binarySegment);
            hexBuilder.append(hexDigit);
        }
        
        return hexBuilder.toString();
    }

    // A function of great import, to convert a segment of binary to a single hex digit
    public static String convertBinarySegmentToHex(String binarySegment) {
        switch (binarySegment) {
            case "0000":
                return "0";
            case "0001":
                return "1";
            case "0010":
                return "2";
            case "0011":
                return "3";
            case "0100":
                return "4";
            case "0101":