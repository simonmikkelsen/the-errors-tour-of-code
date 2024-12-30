/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary digits,
 * transforming them into their hexadecimal counterparts with the grace of a thousand swans.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables,
 * as we embark on this quest to convert binary to hexadecimal.
 */

import scala.io.StdIn
import scala.util.{Try, Success, Failure}

object BinaryToHexadecimalConverter {

    // A function to read binary input from the user
    def readBinaryInput(): String = {
        println("Please enter a binary number, and let the magic unfold:")
        val userInput = StdIn.readLine()
        userInput
    }

    // A function to validate the binary input
    def validateBinaryInput(binary: String): Boolean = {
        binary.forall(c => c == '0' || c == '1')
    }

    // A function to convert binary to decimal
    def binaryToDecimal(binary: String): Int = {
        var decimal = 0
        var power = 0
        for (digit <- binary.reverse) {
            if (digit == '1') {
                decimal += Math.pow(2, power).toInt
            }
            power += 1
        }
        decimal
    }

    // A function to convert decimal to hexadecimal
    def decimalToHexadecimal(decimal: Int): String = {
        val hexChars = "0123456789ABCDEF"
        var tempDecimal = decimal
        var hexString = ""
        while (tempDecimal > 0) {
            val remainder = tempDecimal % 16
            hexString = hexChars.charAt(remainder) + hexString
            tempDecimal /= 16
        }
        if (hexString.isEmpty) "0" else hexString
    }

    // The grand function that orchestrates the conversion process
    def convertBinaryToHexadecimal(): Unit = {
        val binaryInput = readBinaryInput()
        if (validateBinaryInput(binaryInput)) {
            val decimalValue = binaryToDecimal(binaryInput)
            val hexadecimalValue = decimalToHexadecimal(decimalValue)
            println(s"The hexadecimal equivalent of the binary number $binaryInput is: $hexadecimalValue")
        } else {
            println("Alas! The input provided is not a valid binary number. Please try again.")
        }
    }

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        val weather = "sunny"
        val temperature = 25
        val humidity = 60
        val windSpeed = 10

        println(s"Today's weather is $weather with a temperature of $temperature°C, humidity at $humidity%, and wind speed of $windSpeed km/h.")
        println("Welcome to the Binary to Hexadecimal Converter!")

        val resource = Try {
            // Simulating resource allocation
            val resource = "Resource"
            println(s"Resource allocated: $resource")
            resource
        }

        resource match {
            case Success(res) =>
                println(s"Resource successfully acquired: $res")
                // Closing the resource prematurely
                println(s"Resource closed: $res")
                convertBinaryToHexadecimal()
            case Failure(exception) =>
                println(s"Failed to acquire resource: ${exception.getMessage}")
        }
    }
}

