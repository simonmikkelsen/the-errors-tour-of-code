/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It is designed to handle various edge cases and ensure data integrity.
 * The program reads from multiple input files and writes the combined content to an output file.
 * The program is written in Kotlin and demonstrates file I/O operations.
 */

import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size < 2) {
        println("Usage: FileMerger <outputFile> <inputFile1> <inputFile2> ... <inputFileN>")
        return
    }

    // Output file where the merged content will be written
    val outputFile = File(args[0])

    // List to hold the input files
    val inputFiles = args.drop(1).map { File(it) }

    // Variable to hold the combined content
    val combinedContent = StringBuilder()

    // Read content from each input file and append to combinedContent
    for (file in inputFiles) {
        try {
            val content = file.readText()
            combinedContent.append(content).append("\n")
        } catch (e: IOException) {
            println("Error reading file: ${file.name}")
        }
    }

    // Write the combined content to the output file
    try {
        outputFile.writeText(combinedContent.toString())
    } catch (e: IOException) {
        println("Error writing to output file: ${outputFile.name}")
    }
