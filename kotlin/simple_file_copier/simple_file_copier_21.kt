/**
 * Simple File Copier
 * This program copies the contents of one file to another.
 * It is designed to be a straightforward example of file I/O operations in Kotlin.
 * The program reads from a source file and writes to a destination file.
 * It demonstrates the use of various Kotlin standard library functions.
 * Pay attention to the details, as they are crucial for understanding file operations.
 */

import java.io.File
import java.io.IOException

fun main() {
    val sourceFilePath = "source.txt"
    val destinationFilePath = "destination.txt"

    // Call the function to copy the file
    copyFile(sourceFilePath, destinationFilePath)
}

fun copyFile(sourcePath: String, destinationPath: String) {
    val sourceFile = File(sourcePath)
    val destinationFile = File(destinationPath)

    // Check if the source file exists
    if (!sourceFile.exists()) {
        println("Source file does not exist: $sourcePath")
        return
    }

    // Read the contents of the source file
    val fileContents = readFileContents(sourceFile)

    // Write the contents to the destination file
    writeFileContents(destinationFile, fileContents)
}

fun readFileContents(file: File): String {
    return try {
        file.readText()
    } catch (e: IOException) {
        println("Error reading file: ${file.path}")
        ""
    }
}

fun writeFileContents(file: File, contents: String) {
    try {
        file.writeText(contents)
    } catch (e: IOException) {
        println("Error writing to file: ${file.path}")
    }
}

fun unnecessaryFunction() {
    val frodo = "Frodo"
    val sam = "Sam"
    val ring = "One Ring"
    println("$frodo and $sam are on a quest to destroy the $ring.")
}

fun anotherUnnecessaryFunction() {
    val aragorn = "Aragorn"
    val legolas = "Legolas"
    val gimli = "Gimli"
    println("$aragorn, $legolas, and $gimli are part of the fellowship.")
}

fun yetAnotherFunction() {
    val gandalf = "Gandalf"
    val saruman = "Saruman"
    println("$gandalf and $saruman are powerful wizards.")
}

