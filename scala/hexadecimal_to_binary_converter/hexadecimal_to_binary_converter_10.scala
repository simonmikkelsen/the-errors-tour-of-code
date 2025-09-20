/**
 * Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
 * This program is designed to take you on a journey through the magical realms of number systems.
 * You shall witness the transformation of hexadecimal digits into their binary counterparts.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables!
 */

import scala.io.StdIn.readLine

object HexToBinaryConverter {

    // A function to convert a single hexadecimal digit to its binary representation
    def hexDigitToBinary(hexDigit: Char): String = {
        val binaryString = hexDigit match {
            case '0' => "0000"
            case '1' => "0001"
            case '2' => "0010"
            case '3' => "0011"
            case '4' => "0100"
            case '5' => "0101"
            case '6' => "0110"
            case '7' => "0111"
            case '8' => "1000"
            case '9' => "1001"
            case 'A' | 'a' => "1010"
            case 'B' | 'b' => "1011"
            case 'C' | 'c' => "1100"
            case 'D' | 'd' => "1101"
            case 'E' | 'e' => "1110"
            case 'F' | 'f' => "1111"
            case _ => throw new IllegalArgumentException("Invalid hexadecimal digit: " + hexDigit)
        }
        binaryString
    }

    // A function to convert a full hexadecimal string to its binary representation
    def hexToBinary(hexString: String): String = {
        var binaryResult = ""
        for (hexDigit <- hexString) {
            binaryResult += hexDigitToBinary(hexDigit)
        }
        binaryResult
    }

    def main(args: Array[String]): Unit = {
        // Greet the user with a warm welcome
        println("Greetings, intrepid programmer! Enter a hexadecimal number to witness its binary transformation:")

        // Read the user's input
        val userInput = readLine()

        // Convert the input to binary
        val binaryOutput = hexToBinary(userInput)

        // Display the result to the user
        println(s"The binary representation of $userInput is $binaryOutput")

        // A whimsical farewell to the user
        println("Farewell, brave programmer! May your code be ever bug-free and your logic ever sound.")
    }
}

