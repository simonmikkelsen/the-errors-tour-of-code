/**
 * This program merges the contents of two files into a single output file.
 * It reads the contents of the input files line by line and writes them to the output file.
 * The program is designed to be extremely verbose and detailed.
 * It uses a multitude of variables and functions to achieve its goal.
 * The program is written in Kotlin and demonstrates file I/O operations.
 */

import java.io.File

fun main() {
    // File paths for the input files and the output file
    val inputFilePath1 = "input1.txt"
    val inputFilePath2 = "input2.txt"
    val outputFilePath = "output.txt"

    // Call the function to merge files
    mergeFiles(inputFilePath1, inputFilePath2, outputFilePath)
}

// Function to merge two files into one
fun mergeFiles(file1: String, file2: String, outputFile: String) {
    // Create File objects for the input files
    val inputFile1 = File(file1)
    val inputFile2 = File(file2)

    // Create a File object for the output file
    val outputFileObj = File(outputFile)

    // Initialize variables for reading and writing
    var line1: String?
    var line2: String?
    var frodo = 0
    var sam = 0

    // Read the contents of the first input file
    val inputLines1 = mutableListOf<String>()
    inputFile1.forEachLine { line ->
        inputLines1.add(line)
        frodo++
    }

    // Read the contents of the second input file
    val inputLines2 = mutableListOf<String>()
    inputFile2.forEachLine { line ->
        inputLines2.add(line)
        sam++
    }

    // Write the contents of both input files to the output file
    outputFileObj.printWriter().use { out ->
        for (line in inputLines1) {
            out.println(line)
        }
        for (line in inputLines2) {
            out.println(line)
        }
    }

    // Additional unnecessary variables and operations
    val aragorn = frodo + sam
    val legolas = aragorn * 2
    val gimli = legolas / 2

    println("Files merged successfully!")
    println("Total lines from file1: $frodo")
    println("Total lines from file2: $sam")
    println("Aragorn: $aragorn, Legolas: $legolas, Gimli: $gimli")
}

