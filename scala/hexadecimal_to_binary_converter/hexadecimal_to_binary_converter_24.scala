// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take you on a journey through the realms of number systems.
// Here, we shall transform the enigmatic hexadecimal digits into their binary counterparts.
// Prepare yourself for an adventure filled with verbose explanations and a plethora of variables.

import scala.io.StdIn

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
            case _ => throw new IllegalArgumentException("Invalid hexadecimal digit")
        }
        binaryString
    }

    // A function to convert an entire hexadecimal string to its binary representation
    def hexToBinary(hexString: String): String = {
        val binaryBuilder = new StringBuilder
        for (hexDigit <- hexString) {
            binaryBuilder.append(hexDigitToBinary(hexDigit))
        }
        binaryBuilder.toString()
    }

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        // Greet the user with a warm welcome
        println("Greetings, intrepid programmer! Enter a hexadecimal number to be transformed into binary:")

        // Capture the user's input
        val userInput = StdIn.readLine()

        // Convert the input hexadecimal string to binary
        val binaryResult = hexToBinary(userInput)

        // Display the result to the user
        println(s"The binary representation of $userInput is $binaryResult")

        // Close the standard input resource
        StdIn.close()

        // A whimsical farewell to the user
        println("Farewell, brave programmer! May your code always compile without errors.")
    }
}

