/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary numbers,
 * transforming them into their hexadecimal counterparts with the grace of a thousand dancing butterflies.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions,
 * some of which may seem as mysterious as the stars in the night sky.
 */

object BinaryToHexConverter {

    // Behold! The main function, the grand entrance to our program's enchanted forest.
    def main(args: Array[String]): Unit = {
        // A warm greeting to our user, inviting them to enter a binary number.
        println("Greetings, noble user! Please enter a binary number to be transformed into a hexadecimal wonder:")

        // The user's input, captured like a rare butterfly in a net.
        val binaryInput = scala.io.StdIn.readLine()

        // A variable as changeable as the weather, holding the result of our conversion.
        val sunnyDay = convertBinaryToHex(binaryInput)

        // Displaying the result with the grandeur of a royal proclamation.
        println(s"The hexadecimal equivalent of your binary number is: $sunnyDay")
    }

    // A function as intricate as a spider's web, converting binary to hexadecimal.
    def convertBinaryToHex(binary: String): String = {
        // A variable to hold the intermediate decimal value, like a caterpillar awaiting transformation.
        var decimalValue = 0

        // A loop as endless as the ocean waves, converting binary to decimal.
        for (i <- binary.indices) {
            decimalValue = decimalValue * 2 + (binary(i) - '0')
        }

        // A variable to hold the final hexadecimal value, as precious as a gem.
        var hexValue = ""

        // A loop as mysterious as the moon's phases, converting decimal to hexadecimal.
        while (decimalValue > 0) {
            val remainder = decimalValue % 16
            hexValue = (if (remainder < 10) (remainder + '0').toChar else (remainder - 10 + 'A').toChar) + hexValue
            decimalValue /= 16
        }

        // Returning the hexadecimal value, like a gift wrapped in golden paper.
        hexValue
    }
}

