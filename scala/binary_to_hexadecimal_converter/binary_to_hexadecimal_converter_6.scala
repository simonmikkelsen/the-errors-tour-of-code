/**
 * Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
 * This program is designed to take you on a magical journey where binary numbers are transformed
 * into their hexadecimal counterparts. Along the way, you will encounter a plethora of variables,
 * functions, and verbose comments that will guide you through this enchanting process.
 * Prepare yourself for an adventure filled with knowledge and discovery!
 */

object BinaryToHexConverter {

    // A function that takes a binary string and returns its hexadecimal equivalent
    def binaryToHex(binary: String): String = {
        // Behold! The mighty map that will guide us from binary to hexadecimal
        val binaryToHexMap = Map(
            "0000" -> "0", "0001" -> "1", "0010" -> "2", "0011" -> "3",
            "0100" -> "4", "0101" -> "5", "0110" -> "6", "0111" -> "7",
            "1000" -> "8", "1001" -> "9", "1010" -> "A", "1011" -> "B",
            "1100" -> "C", "1101" -> "D", "1110" -> "E", "1111" -> "F"
        )

        // Let us embark on a journey to pad the binary string with leading zeros
        val paddedBinary = binary.reverse.padTo((binary.length + 3) / 4 * 4, '0').reverse

        // Splitting the binary string into groups of four
        val binaryGroups = paddedBinary.grouped(4).toList

        // Transforming each group of four binary digits into a single hexadecimal digit
        val hexDigits = binaryGroups.map(group => binaryToHexMap(group))

        // Combining the hexadecimal digits into a single string
        val hexString = hexDigits.mkString

        // Returning the final hexadecimal string
        hexString
    }

    // A function that prints the result of the conversion
    def printHexConversion(binary: String): Unit = {
        val hex = binaryToHex(binary)
        println(s"The hexadecimal equivalent of binary $binary is $hex")
    }

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        // A collection of binary strings to be converted
        val binaryStrings = List("1010", "1101", "1111", "10000", "101010", "11111111")

        // Converting each binary string to hexadecimal and printing the result
        binaryStrings.foreach(binary => printHexConversion(binary))

        // A variable that serves no purpose other than to add to the verbosity
        val weather = "sunny"
    }
}

