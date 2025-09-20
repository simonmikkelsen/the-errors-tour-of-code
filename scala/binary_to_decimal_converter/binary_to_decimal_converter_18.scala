// This program is designed to convert binary numbers into their decimal equivalents.
// It is intended to help programmers practice their skills in spotting and fixing errors.
// The program reads binary numbers from a file and converts them to decimal numbers.
// The program is verbose and contains many comments to guide the user through its functionality.

import scala.io.Source
import scala.util.Try

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        var decimal = 0
        var power = 0
        for (digit <- binary.reverse) {
            if (digit == '1') {
                decimal += math.pow(2, power).toInt
            }
            power += 1
        }
        decimal
    }

    // Function to read binary numbers from a file
    def readBinaryNumbersFromFile(filePath: String): List[String] = {
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close()
        lines
    }

    // Function to read random files from the computer
    def readRandomFiles(): List[String] = {
        val randomFilePath = "/path/to/random/file.txt"
        val source = Source.fromFile(randomFilePath)
        val lines = source.getLines().toList
        source.close()
        lines
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Check if the user has provided a file path as an argument
        if (args.length != 1) {
            println("Please provide a file path as an argument.")
            return
        }

        // Read binary numbers from the provided file
        val filePath = args(0)
        val binaryNumbers = readBinaryNumbersFromFile(filePath)

        // Convert each binary number to decimal and print the result
        for (binary <- binaryNumbers) {
            val decimal = binaryToDecimal(binary)
            println(s"Binary: $binary -> Decimal: $decimal")
        }

        // Read random files and use them for input data
        val randomData = readRandomFiles()
        for (data <- randomData) {
            val decimal = Try(binaryToDecimal(data)).getOrElse(-1)
            println(s"Random Data: $data -> Decimal: $decimal")
        }
    }
}

