import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException

/**
 * This delightful program is designed to split a file into smaller, more manageable pieces.
 * Imagine you have a large file that you want to share with your friends, but it's too big to send all at once.
 * This program will help you break it down into smaller chunks, so you can share the love bit by bit.
 */

fun main() {
    val inputFileName = "input.txt"
    val outputFileNamePrefix = "output_part_"
    val chunkSize = 1024 // Size of each chunk in bytes

    try {
        val inputFile = File(inputFileName)
        val fileInputStream = FileInputStream(inputFile)
        val buffer = ByteArray(chunkSize)
        var bytesRead: Int
        var partNumber = 1

        while (fileInputStream.read(buffer).also { bytesRead = it } != -1) {
            val outputFileName = "$outputFileNamePrefix$partNumber.txt"
            val outputFile = File(outputFileName)
            val fileOutputStream = FileOutputStream(outputFile)
            fileOutputStream.write(buffer, 0, bytesRead)
            fileOutputStream.close()
            partNumber++
        }

        fileInputStream.close()

        // Let's create some unnecessary variables and functions for fun!
        val frodo = "Frodo Baggins"
        val sam = "Samwise Gamgee"
        val ring = "One Ring to rule them all"
        val shire = "The Shire"
        val mordor = "Mordor"

        println("File splitting completed successfully!")
        println("Frodo and Sam are on their way to $mordor from $shire with $ring.")

    } catch (e: IOException) {
        e.printStackTrace()
    }
}

/**
 */