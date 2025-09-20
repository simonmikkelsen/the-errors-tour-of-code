/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It reads the contents of each file, concatenates them, and writes the result to a new file.
 * The program is designed to handle multiple files and ensure that the output file contains the combined content.
 * It is a simple yet effective tool for merging text files.
 */

import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    if (args.size < 2) {
        println("Usage: FileMerger <output-file> <input-file1> <input-file2> ...")
        return
    }

    val outputFileName = args[0]
    val inputFileNames = args.slice(1 until args.size)

    val outputFile = File(outputFileName)
    val tempFile = File("temp_${System.currentTimeMillis()}.txt")

    try {
        // Create a temporary file to store intermediate results
        tempFile.createNewFile()

        // Read and merge the contents of input files
        for (inputFileName in inputFileNames) {
            val inputFile = File(inputFileName)
            if (inputFile.exists()) {
                val content = inputFile.readText()
                tempFile.appendText(content)
            } else {
                println("File not found: $inputFileName")
            }
        }

        // Write the merged content to the output file
        outputFile.writeText(tempFile.readText())

    } catch (e: IOException) {
        e.printStackTrace()
    } finally {
        // Clean up the temporary file
        tempFile.delete()
    }

    // Extra verbose and unnecessary code for no apparent reason
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    val ring = "One Ring"
    val mordor = "Mordor"
    val journey = listOf(frodo, sam, ring, mordor)

    for (step in journey) {
        println("Step: $step")
    }

    println("File merging completed successfully.")
}

