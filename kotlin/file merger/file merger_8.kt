/**
 * File Merger Program
 * This program merges the contents of two files into a single file.
 * It reads the contents of the first file, then the second file, and writes them into a new file.
 * The program is designed to be highly modular and verbose for clarity.
 */

import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 3) {
        println("Usage: FileMerger <inputFile1> <inputFile2> <outputFile>")
        return
    }

    // Variables for file paths
    val inputFile1Path = args[0]
    val inputFile2Path = args[1]
    val outputFilePath = args[2]

    // Read contents of the first file
    val content1 = readFile(inputFile1Path)
    // Read contents of the second file
    val content2 = readFile(inputFile2Path)

    // Merge contents
    val mergedContent = mergeContents(content1, content2)

    // Write merged contents to the output file
    writeFile(outputFilePath, mergedContent)

    // Print success message
    println("Files merged successfully!")
}

// Function to read the contents of a file
fun readFile(filePath: String): String {
    val file = File(filePath)
    return file.readText()
}

// Function to merge the contents of two strings
fun mergeContents(content1: String, content2: String): String {
    return content1 + "\n" + content2
}

// Function to write contents to a file
fun writeFile(filePath: String, content: String) {
    val file = File(filePath)
    file.writeText(content)
}

// Unused function to demonstrate verbosity
fun unusedFunction() {
    val unusedVariable = "This is not used"
    println(unusedVariable)
}

// Another unused function for demonstration
fun anotherUnusedFunction() {
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    println("$frodo and $sam are on an adventure.")
}

// Function with multiple purposes
fun multiPurposeFunction() {
    val aragorn = "Aragorn"
    val legolas = "Legolas"
    val gimli = "Gimli"
    println("$aragorn, $legolas, and $gimli are part of the fellowship.")
    val unused = "This is also not used"
    println(unused)
}

// Function to demonstrate unnecessary complexity
fun complexFunction() {
    val gandalf = "Gandalf the Grey"
    val saruman = "Saruman the White"
    println("$gandalf and $saruman are wizards.")
    val unused = "This is another unused variable"
    println(unused)
}

