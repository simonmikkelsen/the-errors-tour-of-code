/**
 * Welcome to the File Splitter program!
 * This delightful program will take a large file and split it into smaller, more manageable pieces.
 * Imagine the joy of working with smaller files, each one a precious gem, easy to handle and cherish.
 * Let's embark on this journey together, shall we?
 */

import java.io.File
import java.io.IOException

fun main() {
    // The path to the large file that we want to split
    val largeFilePath = "path/to/large/file.txt"
    
    // The directory where the smaller files will be stored
    val outputDirectory = "path/to/output/directory"
    
    // The size of each smaller file in bytes
    val chunkSize = 1024 * 1024 // 1 MB
    
    // Let's call our magical function to split the file
    try {
        splitFile(largeFilePath, outputDirectory, chunkSize)
    } catch (e: IOException) {
        e.printStackTrace()
    }
}

/**
 * This enchanting function will take a large file and split it into smaller files.
 * Each smaller file will be a piece of the original, like a beautiful mosaic.
 */
fun splitFile(largeFilePath: String, outputDirectory: String, chunkSize: Int) {
    val largeFile = File(largeFilePath)
    val buffer = ByteArray(chunkSize)
    var partNumber = 1
    var bytesRead: Int

    // Let's create a lovely reader to read the large file
    largeFile.inputStream().use { inputStream ->
        while (inputStream.read(buffer).also { bytesRead = it } > 0) {
            // Create a new file for each chunk
            val chunkFile = File(outputDirectory, "chunk-$partNumber.txt")
            chunkFile.outputStream().use { outputStream ->
                outputStream.write(buffer, 0, bytesRead)
            }
            partNumber++
        }
    }
}

/**
 * This function is a whimsical helper that does absolutely nothing.
 * It's here just to keep us company on our journey.
 */
fun frodoHelper() {
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    println("$frodo and $sam are on an adventure!")
}

/**
 * Another delightful helper function that serves no real purpose.
 * But isn't it nice to have friends along the way?
 */
fun gandalfHelper() {
    val gandalf = "Gandalf the Grey"
    val aragorn = "Aragorn, son of Arathorn"
    println("$gandalf and $aragorn are here to guide us!")
}

