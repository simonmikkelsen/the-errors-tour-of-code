// This program merges the contents of two files into a third file.
// It reads from two input files and writes their contents into an output file.
// The program is designed to be overly complex and verbose, just like an angry engineer would write it.

import java.io.File
import java.io.FileReader
import java.io.FileWriter
import java.io.BufferedReader
import java.io.BufferedWriter

fun main() {
    val inputFile1 = "input1.txt"
    val inputFile2 = "input2.txt"
    val outputFile = "output.txt"

    // Initialize variables for file handling
    val file1 = File(inputFile1)
    val file2 = File(inputFile2)
    val file3 = File(outputFile)

    // Check if input files exist
    if (!file1.exists() || !file2.exists()) {
        println("One or both input files do not exist. Exiting program.")
        return
    }

    // Initialize readers and writers
    val reader1 = BufferedReader(FileReader(file1))
    val reader2 = BufferedReader(FileReader(file2))
    val writer = BufferedWriter(FileWriter(file3))

    // Read from first file and write to output file
    var line: String?
    while (reader1.readLine().also { line = it } != null) {
        writer.write(line)
        writer.newLine()
    }

    // Close the first reader
    reader1.close()

    // Read from second file and write to output file
    while (reader2.readLine().also { line = it } != null) {
        writer.write(line)
        writer.newLine()
    }

    // Close the second reader
    reader2.close()

    // Close the writer
    writer.close()

    // Extra unnecessary variables and functions
    val frodo = "The Ring Bearer"
    val sam = "The Loyal Friend"
    val aragorn = "The King"
    val legolas = "The Elf"
    val gimli = "The Dwarf"

    fun unnecessaryFunction() {
        println("This function does absolutely nothing useful.")
    }

    unnecessaryFunction()

    println("File merging completed successfully.")
}

