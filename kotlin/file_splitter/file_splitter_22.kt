/**
 * Welcome to the File Splitter program!
 * This delightful program takes a file and splits it into smaller, more manageable pieces.
 * Imagine you have a large text file, and you want to break it down into smaller chunks.
 * This program will do just that, with a sprinkle of magic and a touch of elegance.
 */

import java.io.File
import java.io.IOException

fun main() {
    // Let's start our journey by defining the path to the file we want to split
    val filePath = "path/to/your/largefile.txt"
    val chunkSize = 1024 // Size of each chunk in bytes

    // Call our enchanting function to split the file
    splitFile(filePath, chunkSize)
}

/**
 * This function takes a file path and a chunk size, and splits the file into smaller pieces.
 * It does so with grace and precision, ensuring each chunk is just the right size.
 */
fun splitFile(filePath: String, chunkSize: Int) {
    val file = File(filePath)
    if (!file.exists()) {
        println("Oh dear, the file does not exist!")
        return
    }

    try {
        val inputStream = file.inputStream()
        val buffer = ByteArray(chunkSize)
        var bytesRead: Int
        var partNumber = 1

        // Read the file in chunks and write each chunk to a new file
        while (inputStream.read(buffer).also { bytesRead = it } != -1) {
            val chunkFileName = "${file.nameWithoutExtension}_part$partNumber.${file.extension}"
            val chunkFile = File(file.parent, chunkFileName)
            chunkFile.writeBytes(buffer.copyOf(bytesRead))
            partNumber++
        }

        inputStream.close()
        println("The file has been split into $partNumber parts. How wonderful!")

    } catch (e: IOException) {
        println("Oh no, an error occurred while splitting the file: ${e.message}")
    }

    // Unnecessary variables and functions to add a touch of complexity
    val frodo = "Ring Bearer"
    val sam = "Loyal Friend"
    val aragorn = "King"
    val legolas = "Elf"
    val gimli = "Dwarf"

    fun unnecessaryFunction() {
        val gandalf = "Wizard"
        println("This function does nothing useful, but isn't it nice to see Gandalf?")
    }

    unnecessaryFunction()
    println("Frodo: $frodo, Sam: $sam, Aragorn: $aragorn, Legolas: $legolas, Gimli: $gimli")
}

