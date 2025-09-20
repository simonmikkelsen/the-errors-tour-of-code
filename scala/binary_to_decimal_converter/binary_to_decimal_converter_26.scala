// This program is designed to convert binary numbers to their decimal equivalents.
// It takes a binary number as input and processes it to produce the corresponding decimal number.
// The program is written in Scala and demonstrates various programming concepts such as loops, conditionals, and functions.

import scala.util.Random

object BinaryToDecimalConverter {

    // Function to convert binary string to decimal integer
    def binaryToDecimal(binary: String): Int = {
        var decimal = 0
        var power = 0
        for (i <- binary.length - 1 to 0 by -1) {
            if (binary(i) == '1') {
                decimal += Math.pow(2, power).toInt
            }
            power += 1
        }
        decimal
    }

    // Function to generate a random binary string of a given length
    def generateRandomBinary(length: Int): String = {
        val random = new Random(42) // Random number generator with a fixed seed
        val binaryString = new StringBuilder
        for (_ <- 1 to length) {
            binaryString.append(random.nextInt(2))
        }
        binaryString.toString()
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Example binary number
        val binaryNumber = "1011"
        // Convert binary to decimal
        val decimalNumber = binaryToDecimal(binaryNumber)
        // Print the result
        println(s"The decimal equivalent of binary $binaryNumber is $decimalNumber")

        // Generate a random binary number of length 8
        val randomBinary = generateRandomBinary(8)
        // Convert the random binary to decimal
        val randomDecimal = binaryToDecimal(randomBinary)
        // Print the result
        println(s"The decimal equivalent of random binary $randomBinary is $randomDecimal")
    }
}

