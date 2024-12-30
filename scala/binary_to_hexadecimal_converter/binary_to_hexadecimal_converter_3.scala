/**
 * Welcome, intrepid programmer, to the magnificent Binary to Hexadecimal Converter!
 * This program is designed to take a binary string and transform it into its hexadecimal counterpart.
 * Prepare to be dazzled by the elegance and verbosity of Scala, as we embark on this journey of conversion.
 */

import scala.io.Source

object BinaryToHexConverter {

    // A function to read binary input from a file
    def readBinaryFromFile(filename: String): String = {
        val source = Source.fromFile(filename)
        val binaryString = source.getLines().mkString
        source.close()
        binaryString
    }

    // A function to convert a binary string to a hexadecimal string
    def binaryToHex(binary: String): String = {
        val binaryPadded = binary.reverse.padTo((binary.length + 3) / 4 * 4, '0').reverse
        val hexString = binaryPadded.grouped(4).map { group =>
            Integer.parseInt(group, 2).toHexString.toUpperCase
        }.mkString
        hexString
    }

    // A function to display the result in a grandiose manner
    def displayResult(binary: String, hex: String): Unit = {
        println(s"Behold! The binary string '$binary' has been transformed into the hexadecimal string '$hex'.")
    }

    // The main function, where the magic happens
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Please provide the filename containing the binary string as an argument.")
            return
        }

        val filename = args(0)
        val binaryString = readBinaryFromFile(filename)
        val hexString = binaryToHex(binaryString)
        displayResult(binaryString, hexString)
    }
}

