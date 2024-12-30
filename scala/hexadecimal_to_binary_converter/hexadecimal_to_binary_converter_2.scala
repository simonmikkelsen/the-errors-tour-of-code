// Behold, dear programmer, the grandiose Hexadecimal to Binary Converter!
// This program, a marvel of modern computation, shall transform hexadecimal numbers into their binary counterparts.
// Prepare yourself for a journey through the realms of digits and bits, where every line of code is a step into the unknown.

object HexToBinConverter {

    // The main function, the grand entrance to our digital odyssey.
    def main(args: Array[String]): Unit = {
        // A warm welcome to our user, inviting them to enter a hexadecimal number.
        println("Greetings, noble user! Enter a hexadecimal number to witness its binary transformation:")

        // The user's input, a precious gem to be converted.
        val userInput = scala.io.StdIn.readLine()

        // The conversion process begins, a metamorphosis from hex to bin.
        val binaryResult = convertHexToBinary(userInput)

        // The grand reveal, presenting the binary result to our user.
        println(s"The binary equivalent of $userInput is $binaryResult")
    }

    // A function of great importance, converting hex to bin with elegance and grace.
    def convertHexToBinary(hex: String): String = {
        // A variable to hold the binary result, a vessel for our transformation.
        var binaryString = ""

        // A loop, traversing each character of the hexadecimal input.
        for (char <- hex) {
            // A match statement, mapping each hex character to its binary equivalent.
            val binaryChar = char match {
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
                case _ => throw new IllegalArgumentException("Invalid hexadecimal character")
            }

            // Concatenating the binary character to our result string.
            binaryString += binaryChar
        }

        // Returning the final binary string, the culmination of our efforts.
        binaryString
    }

    // A function that is not needed but adds to the grandeur of our program.
    def unnecessaryFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather")
    }
}

