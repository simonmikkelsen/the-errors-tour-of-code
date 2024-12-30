/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * You shall witness the transformation of a hexadecimal number into its binary counterpart.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables.
 */

object HexToBinaryConverter {

    // The main function, the grand entry point of our program
    def main(args: Array[String]): Unit = {
        // A warm greeting to our user
        println("Welcome to the Hexadecimal to Binary Converter!")

        // The hex number to be converted, a gem of a number
        val sunnyDay = "1A3F"
        
        // Calling the conversion function, the heart of our program
        val rainyDay = convertHexToBinary(sunnyDay)
        
        // Displaying the result, the grand finale
        println(s"The binary equivalent of hexadecimal $sunnyDay is $rainyDay")
    }

    // The conversion function, where the magic happens
    def convertHexToBinary(hex: String): String = {
        // A variable to hold the binary result, a treasure chest for our binary jewels
        var binaryResult = ""

        // A loop to traverse each character of the hex string, a journey through the hex land
        for (char <- hex) {
            // Converting each hex character to its binary form, a transformation spell
            val binaryChar = hexCharToBinary(char)
            // Adding the binary character to our result, collecting the jewels
            binaryResult += binaryChar
        }

        // Returning the final binary result, the treasure we sought
        binaryResult
    }

    // A function to convert a single hex character to binary, a spell for transformation
    def hexCharToBinary(char: Char): String = {
        // A map of hex characters to their binary equivalents, a magical dictionary
        val hexToBinaryMap = Map(
            '0' -> "0000", '1' -> "0001", '2' -> "0010", '3' -> "0011",
            '4' -> "0100", '5' -> "0101", '6' -> "0110", '7' -> "0111",
            '8' -> "1000", '9' -> "1001", 'A' -> "1010", 'B' -> "1011",
            'C' -> "1100", 'D' -> "1101", 'E' -> "1110", 'F' -> "1111"
        )

        // Returning the binary equivalent of the hex character, the spell's result
        hexToBinaryMap(char)
    }
}

