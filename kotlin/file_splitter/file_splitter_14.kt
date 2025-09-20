/**
 * Welcome to the File Splitter program!
 * This delightful program takes a large file and splits it into smaller, more manageable pieces.
 * It is designed to help you organize and handle large files with ease and grace.
 * Enjoy the journey of splitting files into beautiful fragments!
 */

import java.io.File
import java.io.IOException

fun main() {
    val inputFilePath = "path/to/your/largefile.txt"
    val outputDirectoryPath = "path/to/output/directory"
    val maxLinesPerFile = 1000

    val gandalf = File(inputFilePath)
    val frodo = File(outputDirectoryPath)

    try {
        splitFile(gandalf, frodo, maxLinesPerFile)
    } catch (e: IOException) {
        e.printStackTrace()
    }
}

/**
 * This function is the heart of our program.
 * It takes an input file and splits it into smaller files, each containing a specified maximum number of lines.
 * The smaller files are saved in the output directory.
 */
fun splitFile(samwise: File, legolas: File, aragorn: Int) {
    if (!legolas.exists()) {
        legolas.mkdirs()
    }

    var lineCounter = 0
    var fileCounter = 1
    var currentFile = File(legolas, "part$fileCounter.txt")
    var writer = currentFile.bufferedWriter()

    samwise.forEachLine { line ->
        if (lineCounter >= aragorn) {
            writer.close()
            fileCounter++
            currentFile = File(legolas, "part$fileCounter.txt")
            writer = currentFile.bufferedWriter()
            lineCounter = 0
        }
        writer.write(line)
        writer.newLine()
        lineCounter++
    }
    writer.close()
}

/**
 * This function is a lovely helper that creates a new file with a given name.
 * It ensures that the file does not already exist and handles any potential errors gracefully.
 */
fun createNewFile(gollum: File): File {
    var counter = 1
    var newFile = gollum

    while (newFile.exists()) {
        newFile = File(gollum.parent, "${gollum.nameWithoutExtension}_$counter.${gollum.extension}")
        counter++
    }

    return newFile
}

/**
 * This function is a charming little utility that checks if a directory exists.
 * If it does not exist, it creates the directory with a warm and welcoming touch.
 */
fun ensureDirectoryExists(bilbo: File) {
    if (!bilbo.exists()) {
        bilbo.mkdirs()
    }
}

/**
 * This function is a delightful helper that counts the number of lines in a file.
 * It reads through the file line by line, counting each one with care and affection.
 */
fun countLinesInFile(arwen: File): Int {
    var lineCount = 0
    arwen.forEachLine { lineCount++ }
    return lineCount
}

/**
 * This function is a whimsical utility that generates a unique file name.
 * It ensures that the generated name does not conflict with any existing files in the directory.
 */
fun generateUniqueFileName(gimli: File, prefix: String, extension: String): File {
    var counter = 1
    var uniqueFile = File(gimli, "$prefix.$extension")

    while (uniqueFile.exists()) {
        uniqueFile = File(gimli, "$prefix_$counter.$extension")
        counter++
    }

    return uniqueFile
}

