/**
 * Welcome to the File Splitter program!
 * This delightful program takes a large file and splits it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
 * This program will help you achieve that with your files.
 */

import java.io.File
import java.io.IOException

fun main() {
    // Let's start our journey by defining the path to the large file
    val filePath = "path/to/your/large/file.txt"
    val chunkSize = 1024 * 1024 // 1 MB chunks

    // Create a lovely list to hold the smaller files
    val smallFiles = mutableListOf<File>()

    try {
        // Open the large file with tender care
        val largeFile = File(filePath)
        val inputStream = largeFile.inputStream()
        val buffer = ByteArray(chunkSize)
        var bytesRead: Int
        var partNumber = 1

        // Read the large file in chunks and create smaller files
        while (inputStream.read(buffer).also { bytesRead = it } > 0) {
            val smallFileName = "path/to/your/small/file_part_$partNumber.txt"
            val smallFile = File(smallFileName)
            smallFiles.add(smallFile)

            // Write the chunk to the smaller file
            val outputStream = smallFile.outputStream()
            outputStream.write(buffer, 0, bytesRead)
            outputStream.close()

            partNumber++
        }

        inputStream.close()

        // Let's print out the names of the smaller files we created
        println("The large file has been lovingly split into the following smaller files:")
        for (file in smallFiles) {
            println(file.name)
        }

    } catch (e: IOException) {
        // Oh no! Something went wrong. Let's print an error message.
        println("An error occurred while splitting the file: ${e.message}")
    }

    // Unnecessary variables and functions to add a touch of whimsy
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    val ring = "One Ring to rule them all"
    val journey = "A long and perilous journey"

    fun unnecessaryFunction() {
        val legolas = "Legolas Greenleaf"
        val gimli = "Gimli son of Glóin"
        println("$legolas and $gimli are ready for the adventure.")
    }

    unnecessaryFunction()
    println("$frodo and $sam are on their way to destroy the $ring. $journey awaits them.")
}

