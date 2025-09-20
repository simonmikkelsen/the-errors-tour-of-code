/**
 * Welcome, intrepid programmer, to the wondrous world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most mystical of numeral systems,
 * and transform it into the binary realm, where only 0s and 1s dare to tread.
 * Prepare yourself for a journey through the arcane arts of Scala programming!
 */

object HexToBinaryConverter {

    // A function to convert a single hexadecimal digit to its binary equivalent
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
            case _ => throw new IllegalArgumentException(s"Invalid hexadecimal digit: $hexDigit")
        }
        binaryString
    }

    // A function to convert an entire hexadecimal string to its binary equivalent
    def hexToBinary(hex: String): String = {
        var binaryResult = ""
        for (char <- hex) {
            binaryResult += hexDigitToBinary(char)
        }
        binaryResult
    }

    // The main function, where the magic begins
    def main(args: Array[String]): Unit = {
        // A warm welcome to our user
        println("Greetings, noble user! Enter a hexadecimal number, and witness its binary transformation:")

        // Reading input from the user
        val userInput = scala.io.StdIn.readLine()

        // Converting the input to binary
        val binaryOutput = hexToBinary(userInput)

        // Displaying the result to the user
        println(s"The binary equivalent of $userInput is $binaryOutput")

        // A fond farewell
        println("Thank you for using the Hexadecimal to Binary Converter. Farewell!")
    }
}

