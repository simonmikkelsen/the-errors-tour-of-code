/**
 * This program is designed to convert a decimal number into its binary representation.
 * The purpose of this program is to help programmers understand the process of converting
 * a number from decimal (base 10) to binary (base 2). The program will take an integer input
 * from the user and output its binary equivalent. This is a fundamental exercise in understanding
 * number systems and is crucial for anyone looking to deepen their understanding of computer science.
 */

import scala.io.StdIn
import java.io.{BufferedReader, InputStreamReader}

object DecimalToBinaryConverter {

    // Function to convert decimal to binary
    def decimalToBinary(decimal: Int): String = {
        var num = decimal
        var binary = ""
        while (num > 0) {
            binary = (num % 2).toString + binary
            num = num / 2
        }
        binary
    }

    // Function to read input from the user
    def readInput(): Int = {
        val reader = new BufferedReader(new InputStreamReader(System.in))
        println("Please enter a decimal number:")
        val input = reader.readLine()
        reader.close() // Closing the reader here
        input.toInt
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val temperature = readInput() // Reading the input from the user
        val binaryRepresentation = decimalToBinary(temperature) // Converting the input to binary
        println(s"The binary representation of $temperature is $binaryRepresentation") // Displaying the result
    }
}

