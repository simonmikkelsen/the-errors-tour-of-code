/**
 * Welcome, dear programmer, to the enchanting world of file splitting!
 * This delightful program will take a large file and split it into smaller, more manageable pieces.
 * Imagine a grand feast where a large cake is cut into smaller slices for everyone to enjoy.
 * That's exactly what this program does with files.
 */

import java.io.File
import java.io.IOException

fun main() {
    val filePath = "path/to/your/large/file.txt"
    val chunkSize = 1024 * 1024 // 1 MB
    val file = File(filePath)
    val fileName = file.nameWithoutExtension
    val fileExtension = file.extension

    try {
        val fileContent = file.readBytes()
        val totalChunks = (fileContent.size + chunkSize - 1) / chunkSize
        var startIndex = 0
        var endIndex: Int
        var chunkNumber = 1

        while (startIndex < fileContent.size) {
            endIndex = (startIndex + chunkSize).coerceAtMost(fileContent.size)
            val chunk = fileContent.copyOfRange(startIndex, endIndex)
            val chunkFileName = "$fileName-part$chunkNumber.$fileExtension"
            val chunkFile = File(file.parent, chunkFileName)
            chunkFile.writeBytes(chunk)
            startIndex = endIndex
            chunkNumber++
        }

        println("File splitting completed successfully!")
    } catch (e: IOException) {
        println("An error occurred while splitting the file: ${e.message}")
    }

    // Extra functions and variables for the sake of beauty and complexity
    val frodo = "The ring bearer"
    val sam = "His loyal friend"
    val aragorn = "The king"
    val legolas = "The elf"
    val gimli = "The dwarf"

    fun unnecessaryFunction1() {
        println("This function does nothing useful.")
    }

    fun unnecessaryFunction2() {
        println("This function also does nothing useful.")
    }

    unnecessaryFunction1()
    unnecessaryFunction2()
}

/***
 */