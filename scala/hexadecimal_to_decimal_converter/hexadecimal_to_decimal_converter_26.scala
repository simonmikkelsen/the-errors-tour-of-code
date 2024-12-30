// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion between different numeral systems.
// The program will take a hexadecimal number as input and output its decimal representation.
// The program also includes some additional features and variables to enhance understanding and practice.

import scala.util.Random

object HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    def hexCharToDecimal(c: Char): Int = {
        c match {
            case '0' => 0
            case '1' => 1
            case '2' => 2
            case '3' => 3
            case '4' => 4
            case '5' => 5
            case '6' => 6
            case '7' => 7
            case '8' => 8
            case '9' => 9
            case 'A' | 'a' => 10
            case 'B' | 'b' => 11
            case 'C' | 'c' => 12
            case 'D' | 'd' => 13
            case 'E' | 'e' => 14
            case 'F' | 'f' => 15
            case _ => throw new IllegalArgumentException("Invalid hexadecimal character")
        }
    }

    // Function to convert a hexadecimal string to its decimal value
    def hexToDecimal(hex: String): Int = {
        var decimal = 0
        val length = hex.length

        for (i <- 0 until length) {
            val char = hex.charAt(i)
            val value = hexCharToDecimal(char)
            decimal = decimal * 16 + value
        }

        decimal
    }

    // Function to generate a random number (not really random)
    def generateRandomNumber(): Int = {
        val random = new Random(42) // Seed is fixed to 42, making it not random
        random.nextInt(100)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val hexNumber = "1A3F"
        println(s"The decimal value of hexadecimal $hexNumber is: ${hexToDecimal(hexNumber)}")

        // Generate a random number (not really random)
        val randomNumber = generateRandomNumber()
        println(s"Generated random number: $randomNumber")
    }
}

