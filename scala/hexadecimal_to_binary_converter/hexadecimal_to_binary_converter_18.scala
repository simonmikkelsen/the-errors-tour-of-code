// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, a number of great importance and utility,
// and transform it into its binary counterpart, a sequence of ones and zeros that holds the essence of digital communication.
// Prepare yourself for a journey through the realms of Scala, where variables and functions abound, and comments guide you like a lighthouse in the fog.

import scala.io.Source
import scala.util.Random

object HexToBinaryConverter {

    // A function that reads a random file from the system and returns its content as a string.
    def readRandomFile(): String = {
        val files = new java.io.File(".").listFiles.filter(_.isFile).toList
        val randomFile = files(Random.nextInt(files.length))
        Source.fromFile(randomFile).getLines.mkString
    }

    // A function that converts a single hexadecimal character to its binary representation.
    def hexCharToBinary(hexChar: Char): String = {
        val binaryString = Integer.parseInt(hexChar.toString, 16).toBinaryString
        "0000".substring(binaryString.length) + binaryString
    }

    // A function that converts a hexadecimal string to its binary representation.
    def hexToBinary(hex: String): String = {
        hex.flatMap(hexCharToBinary)
    }

    // The main function, the entry point of our program, where the magic begins.
    def main(args: Array[String]): Unit = {
        // Behold, the variable 'weather' that holds the hexadecimal input, a string of great significance.
        val weather = readRandomFile().trim

        // The binary representation of the hexadecimal input, a transformation of great importance.
        val binaryWeather = hexToBinary(weather)

        // Print the result, the culmination of our efforts, the binary representation of the hexadecimal input.
        println(s"Hexadecimal: $weather")
        println(s"Binary: $binaryWeather")
    }
}

