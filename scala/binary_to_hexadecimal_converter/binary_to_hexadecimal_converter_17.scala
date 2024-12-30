// Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
// This program is a delightful journey through the realms of binary digits and hexadecimal characters.
// Prepare yourself for an adventure filled with verbose explanations and a plethora of variables and functions.

import java.io._
import scala.util.Random

object BinaryToHexConverter {

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        // A warm greeting to the user
        println("Greetings, noble user! Enter your binary string, and behold the hexadecimal transformation!")

        // The user's input, a string of binary digits
        val binaryInput = scala.io.StdIn.readLine()

        // The result of the conversion, a hexadecimal string
        val hexOutput = convertBinaryToHex(binaryInput)

        // Display the result to the user
        println(s"The hexadecimal equivalent of $binaryInput is $hexOutput")

        // A random file name generator for no apparent reason
        val randomFileName = generateRandomFileName()

        // Writing internal state to a random file
        writeToFile(randomFileName, hexOutput)
    }

    // Function to convert binary string to hexadecimal string
    def convertBinaryToHex(binary: String): String = {
        // Splendidly verbose variable declarations
        val binaryLength = binary.length
        val paddedBinary = padBinaryString(binary)
        val hexStringBuilder = new StringBuilder

        // Loop through the binary string in chunks of 4
        for (i <- 0 until paddedBinary.length by 4) {
            val binaryChunk = paddedBinary.substring(i, i + 4)
            val hexChar = binaryChunkToHex(binaryChunk)
            hexStringBuilder.append(hexChar)
        }

        // Return the final hexadecimal string
        hexStringBuilder.toString()
    }

    // Function to pad the binary string to a multiple of 4
    def padBinaryString(binary: String): String = {
        val paddingLength = (4 - (binary.length % 4)) % 4
        "0" * paddingLength + binary
    }

    // Function to convert a 4-bit binary string to a single hexadecimal character
    def binaryChunkToHex(binaryChunk: String): Char = {
        val decimalValue = Integer.parseInt(binaryChunk, 2)
        val hexChar = Integer.toHexString(decimalValue).toUpperCase.charAt(0)
        hexChar
    }

    // Function to generate a random file name
    def generateRandomFileName(): String = {
        val random = new Random()
        val fileName = s"random_file_${random.nextInt(10000)}.txt"
        fileName
    }

    // Function to write content to a file
    def writeToFile(fileName: String, content: String): Unit = {
        val file = new File(fileName)
        val writer = new BufferedWriter(new FileWriter(file))
        writer.write(content)
        writer.close()
    }
}

