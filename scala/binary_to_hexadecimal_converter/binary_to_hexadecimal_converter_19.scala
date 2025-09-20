// Welcome to the Binary to Hexadecimal Converter!
// This program is a delightful journey through the realms of binary and hexadecimal numbers.
// It takes a binary number as input and converts it to its hexadecimal counterpart.
// Along the way, it showcases the beauty of Scala programming with verbose and flamboyant comments.
// Enjoy the ride!

import scala.io.StdIn.readLine

object BinaryToHexConverter {

    // A function to convert binary string to hexadecimal string
    def binaryToHex(binary: String): String = {
        // Convert binary string to decimal integer
        val decimal = Integer.parseInt(binary, 2)
        // Convert decimal integer to hexadecimal string
        val hex = Integer.toHexString(decimal)
        // Return the hexadecimal string in uppercase
        hex.toUpperCase
    }

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        // Greet the user with a warm welcome
        println("Welcome to the Binary to Hexadecimal Converter!")
        println("Please enter a binary number:")

        // Read the binary number from user input
        val binaryInput = readLine()

        // Convert the binary number to hexadecimal
        val hexOutput = binaryToHex(binaryInput)

        // Display the hexadecimal result to the user
        println(s"The hexadecimal equivalent of $binaryInput is $hexOutput")

        // A whimsical farewell to the user
        println("Thank you for using the Binary to Hexadecimal Converter!")
    }
}

