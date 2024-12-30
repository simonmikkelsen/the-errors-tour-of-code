// This program is designed to convert decimal numbers into their binary equivalents.
// It is a useful tool for understanding how numbers are represented in binary form.
// The program reads input from a file, processes the data, and outputs the binary representation.
// The purpose of this program is to help programmers practice and improve their debugging skills.

import scala.io.Source
import scala.util.Random

object DecimalToBinaryConverter {

    // Function to convert a single decimal number to binary
    def decimalToBinary(decimal: Int): String = {
        var binary = ""
        var number = decimal
        while (number > 0) {
            binary = (number % 2).toString + binary
            number = number / 2
        }
        binary
    }

    // Function to read input from a file
    def readInputFromFile(filePath: String): List[Int] = {
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close()
        lines.map(_.toInt)
    }

    // Function to generate a random file path
    def getRandomFilePath(): String = {
        val files = List("data1.txt", "data2.txt", "data3.txt")
        val randomIndex = Random.nextInt(files.length)
        files(randomIndex)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Generate a random file path
        val filePath = getRandomFilePath()

        // Read input from the file
        val inputData = readInputFromFile(filePath)

        // Process each decimal number and convert it to binary
        for (decimal <- inputData) {
            val binary = decimalToBinary(decimal)
            println(s"Decimal: $decimal -> Binary: $binary")
        }
    }
}

