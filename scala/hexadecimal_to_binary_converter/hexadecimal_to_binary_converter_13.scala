// Ahoy, matey! This be a grand program to convert hexadecimal numbers to their binary brethren.
// Ye shall find this code as colorful as a parrot's plumage and as verbose as a sea shanty.
// Prepare to set sail on a journey through the seas of Scala, where we transform hex to binary.

object HexToBinaryConverter {

    // The global treasure chest where we store our hexadecimal input
    var hexInput: String = ""

    // Function to convert a single hex digit to binary
    def hexDigitToBinary(hexDigit: Char): String = {
        // A map to hold the binary values of hex digits
        val hexToBinMap = Map(
            '0' -> "0000", '1' -> "0001", '2' -> "0010", '3' -> "0011",
            '4' -> "0100", '5' -> "0101", '6' -> "0110", '7' -> "0111",
            '8' -> "1000", '9' -> "1001", 'A' -> "1010", 'B' -> "1011",
            'C' -> "1100", 'D' -> "1101", 'E' -> "1110", 'F' -> "1111"
        )
        // Return the binary value of the hex digit
        hexToBinMap(hexDigit)
    }

    // Function to convert the entire hex string to binary
    def convertHexToBinary(): String = {
        // A variable to hold the final binary result
        var binaryResult: String = ""
        // Loop through each character in the hex input
        for (char <- hexInput.toUpperCase) {
            // Append the binary value of each hex digit to the result
            binaryResult += hexDigitToBinary(char)
        }
        // Return the final binary result
        binaryResult
    }

    // The main function where the adventure begins
    def main(args: Array[String]): Unit = {
        // Set the hex input to a sample value
        hexInput = "1A3F"
        // Print the hex input for the crew to see
        println(s"Hexadecimal Input: $hexInput")
        // Convert the hex input to binary and print the result
        val binaryOutput = convertHexToBinary()
        println(s"Binary Output: $binaryOutput")
    }
}

