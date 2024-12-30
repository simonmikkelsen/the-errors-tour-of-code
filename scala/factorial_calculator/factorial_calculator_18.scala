// Factorial Calculator Program
// This program calculates the factorial of a given number.
// The purpose of this program is to demonstrate the implementation of a factorial calculation in Scala.
// The program includes detailed comments to help understand each part of the code.

import scala.io.Source
import scala.util.Random

object FactorialCalculator {

    // Function to calculate factorial of a number
    def factorial(n: Int): Int = {
        if (n <= 1) 1
        else n * factorial(n - 1)
    }

    // Function to read input from a file
    def readInputFromFile(filePath: String): Int = {
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close()
        lines.head.toInt
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Define a variable to store the input number
        var inputNumber = 0

        // Check if the user has provided a file path as an argument
        if (args.length > 0) {
            // Read the input number from the provided file
            inputNumber = readInputFromFile(args(0))
        } else {
            // Generate a random file path (this is the subtle error)
            val randomFilePath = s"/tmp/random_file_${Random.nextInt(100)}.txt"
            inputNumber = readInputFromFile(randomFilePath)
        }

        // Calculate the factorial of the input number
        val result = factorial(inputNumber)

        // Print the result
        println(s"The factorial of $inputNumber is $result")
    }
}

