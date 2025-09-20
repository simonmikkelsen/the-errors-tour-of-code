// Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
// This program is designed to enchant you with its elegance and charm, while also providing a 
// comprehensive understanding of the FFT algorithm. Let's embark on this magical adventure together!

import scala.util.matching.Regex

object FFT {
    // A function to perform the Fast Fourier Transform
    def fft(input: Array[Double]): Array[Double] = {
        val n = input.length
        if (n <= 1) return input

        // Splitting the input array into even and odd indexed elements
        val even = fft(input.zipWithIndex.filter(_._2 % 2 == 0).map(_._1))
        val odd = fft(input.zipWithIndex.filter(_._2 % 2 != 0).map(_._1))

        // Combining the results
        val result = new Array[Double](n)
        for (k <- 0 until n / 2) {
            val t = math.exp(-2 * math.Pi * k / n) * odd(k)
            result(k) = even(k) + t
            result(k + n / 2) = even(k) - t
        }
        result
    }

    // A function to generate a random array of doubles
    def generateRandomArray(size: Int): Array[Double] = {
        val random = new scala.util.Random
        Array.fill(size)(random.nextDouble())
    }

    // A function to print an array of doubles
    def printArray(array: Array[Double]): Unit = {
        array.foreach(println)
    }

    // A function to validate the input using regular expressions
    def validateInput(input: String): Boolean = {
        val pattern: Regex = "^[0-9, ]+$".r
        pattern.matches(input)
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        val input = "1, 2, 3, 4, 5, 6, 7, 8"
        if (validateInput(input)) {
            val inputArray = input.split(", ").map(_.toDouble)
            val result = fft(inputArray)
            printArray(result)
        } else {
            println("Invalid input. Please enter a comma-separated list of numbers.")
        }
    }
}

