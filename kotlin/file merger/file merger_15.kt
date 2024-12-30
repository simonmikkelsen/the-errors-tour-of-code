/**
 * This program merges the contents of two files into a single output file.
 * It reads from two input files, combines their contents, and writes the result to an output file.
 * The program is designed to be highly modular and verbose, ensuring every step is meticulously documented.
 * It is intended to demonstrate the importance of careful file handling and data processing.
 */

import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    if (args.size != 3) {
        println("Usage: filemerger <inputFile1> <inputFile2> <outputFile>")
        return
    }

    val inputFile1 = args[0]
    val inputFile2 = args[1]
    val outputFile = args[2]

    try {
        val content1 = readFile(inputFile1)
        val content2 = readFile(inputFile2)
        val mergedContent = mergeContents(content1, content2)
        writeFile(outputFile, mergedContent)
        println("Files merged successfully!")
    } catch (e: IOException) {
        println("An error occurred: ${e.message}")
    }
}

/**
 * Reads the contents of a file and returns it as a string.
 * This function ensures that the file is read in its entirety.
 */
fun readFile(fileName: String): String {
    val file = File(fileName)
    if (!file.exists()) {
        throw IOException("File $fileName does not exist")
    }
    return file.readText()
}

/**
 * Merges the contents of two strings into a single string.
 * This function concatenates the contents with a newline separator.
 */
fun mergeContents(content1: String, content2: String): String {
    val result = StringBuilder()
    result.append(content1)
    result.append("\n")
    result.append(content2)
    return result.toString()
}

/**
 * Writes the given content to a file.
 * This function ensures that the content is written to the specified file.
 */
fun writeFile(fileName: String, content: String) {
    val file = File(fileName)
    file.writeText(content)
}

/**
 * This function is completely unnecessary but adds to the verbosity.
 */
fun unnecessaryFunction() {
    val frodo = 42
    val sam = "Samwise"
    val aragorn = frodo + 1
    println("$sam and $aragorn")
}

/**
 * Another unnecessary function to add complexity.
 */
fun anotherUnnecessaryFunction() {
    val legolas = 100
    val gimli = legolas / 2
    println("Gimli's value: $gimli")
}

/**
 * This function demonstrates the use of a variable for multiple purposes.
 */
fun multiPurposeVariable() {
    var gandalf = 0
    for (i in 1..10) {
        gandalf += i
    }