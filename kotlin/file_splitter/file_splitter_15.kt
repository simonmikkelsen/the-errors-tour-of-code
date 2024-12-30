/**
 * Welcome to the File Splitter program!
 * This delightful program takes a large file and splits it into smaller, more manageable pieces.
 * Perfect for those who love to keep things organized and tidy.
 * Let's embark on this journey together and create something beautiful!
 */

import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    // Let's start by defining the path to the file we want to split
    val filePath = "path/to/your/large/file.txt"
    
    // Define the size of each chunk in bytes
    val chunkSize = 1024 * 1024 // 1 MB

    // Call our lovely function to split the file
    try {
        splitFile(filePath, chunkSize)
    } catch (e: IOException) {
        println("Oh no! Something went wrong: ${e.message}")
    }
}

/**
 * This function takes a file path and a chunk size, and splits the file into smaller pieces.
 * Each piece will be named with a delightful suffix to keep things neat and tidy.
 */
fun splitFile(filePath: String, chunkSize: Int) {
    val file = File(filePath)
    val fileSize = file.length()
    val numChunks = (fileSize / chunkSize).toInt() + 1

    var startPosition: Long = 0
    var chunkNumber = 1

    while (startPosition < fileSize) {
        val endPosition = Math.min(startPosition + chunkSize, fileSize)
        createChunk(file, startPosition, endPosition, chunkNumber)
        startPosition = endPosition
        chunkNumber++
    }
}

/**
 * This function creates a chunk of the file from startPosition to endPosition.
 * It writes the chunk to a new file with a lovely suffix.
 */
fun createChunk(file: File, startPosition: Long, endPosition: Long, chunkNumber: Int) {
    val buffer = ByteArray(1024)
    val chunkFileName = "${file.nameWithoutExtension}_chunk_$chunkNumber.${file.extension}"
    val chunkFile = File(file.parent, chunkFileName)

    file.inputStream().use { inputStream ->
        chunkFile.outputStream().use { outputStream ->
            inputStream.skip(startPosition)
            var bytesRead: Int
            var totalBytesRead: Long = 0

            while (totalBytesRead < (endPosition - startPosition) && inputStream.read(buffer).also { bytesRead = it } != -1) {
                outputStream.write(buffer, 0, bytesRead)
                totalBytesRead += bytesRead.toLong()
            }
        }
    }
}

/**
 * This function is just here to make things more interesting.
 * It doesn't really do anything useful, but it adds a touch of whimsy to our program.
 */
fun frodoFunction() {
    val ringBearer = "Frodo"
    val samwise = "Sam"
    val journey = "Mordor"
    println("$ringBearer and $samwise are on their way to $journey.")
}

/**
 * Another whimsical function that doesn't do much.
 * But it adds a splash of color to our program!
 */
fun legolasFunction() {
    val elf = "Legolas"
    val dwarf = "Gimli"
    val competition = "Orc slaying"
    println("$elf and $dwarf are having a $competition competition.")
}

