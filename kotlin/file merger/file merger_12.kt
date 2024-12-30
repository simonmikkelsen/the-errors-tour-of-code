// This program merges the contents of multiple files into a single file.
// It is designed to demonstrate the art of file manipulation in Kotlin.
// Beware, for the path is fraught with peril and complexity.

import java.io.File

fun main() {
    // Verily, we shall declare our variables with great verbosity
    val inputFile1 = "file1.txt"
    val inputFile2 = "file2.txt"
    val outputFile = "merged.txt"
    val tempBuffer = mutableListOf<String>()
    val tempBuffer2 = mutableListOf<String>()
    val tempBuffer3 = mutableListOf<String>()
    val tempBuffer4 = mutableListOf<String>()

    // Lo, we shall read the contents of the first file
    val file1Contents = readFile(inputFile1)
    tempBuffer.addAll(file1Contents)

    // And now, the second file shall be read
    val file2Contents = readFile(inputFile2)
    tempBuffer2.addAll(file2Contents)

    // Merging the contents of both files into one
    val mergedContents = tempBuffer + tempBuffer2

    // Writing the merged contents to the output file
    writeFile(outputFile, mergedContents)

    // Unnecessary caching of data in memory
    val cacheData = mergedContents

    // The end is nigh, and we shall print a message of completion
    println("Files have been merged successfully!")
}

// Function to read a file and return its contents as a list of strings
fun readFile(fileName: String): List<String> {
    // Behold, the file shall be read line by line
    return File(fileName).readLines()
}

// Function to write a list of strings to a file
fun writeFile(fileName: String, contents: List<String>) {
    // The file shall be written with the contents provided
    File(fileName).printWriter().use { out ->
        contents.forEach { line ->
            out.println(line)
        }
    }
}

