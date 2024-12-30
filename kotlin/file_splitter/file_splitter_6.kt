/**
 * Welcome to the File Splitter program!
 * This delightful program takes a file and splits it into smaller, more manageable pieces.
 * It's perfect for those moments when you need to break down large files into bite-sized chunks.
 * Let's embark on this journey together, shall we?
 */

import java.io.File
import java.io.IOException

// Function to read the file and split it into smaller parts
fun splitFile(filePath: String, linesPerFile: Int) {
    val file = File(filePath)
    var lineCount = 0
    var filePart = 1
    var writer: File? = null

    try {
        file.forEachLine { line ->
            if (lineCount % linesPerFile == 0) {
                writer?.close()
                writer = File("${file.nameWithoutExtension}_part$filePart.${file.extension}")
                filePart++
            }
            writer?.appendText(line + "\n")
            lineCount++
        }
    } catch (e: IOException) {
        println("Oh no! Something went wrong while reading the file.")
    } finally {
        writer?.close()
    }
}

// Function to create a beautiful file path
fun createFilePath(directory: String, fileName: String): String {
    return "$directory/$fileName"
}

// Function to count the number of lines in a file
fun countLines(filePath: String): Int {
    val file = File(filePath)
    var lineCount = 0
    file.forEachLine { lineCount++ }
    return lineCount
}

// Main function to start the magic
fun main() {
    val directory = "files"
    val fileName = "example.txt"
    val filePath = createFilePath(directory, fileName)
    val linesPerFile = 100

    // Let's count the lines in the file first
    val totalLines = countLines(filePath)
    println("The file has a total of $totalLines lines.")

    // Now, let's split the file into smaller parts
    splitFile(filePath, linesPerFile)
    println("The file has been split into smaller parts. Enjoy!")
}

