// Ahoy! This be a Kotlin program to merge two files into one. 
// It reads the contents of two files and writes them into a new file. 
// Ye better be ready to sail through the seas of code!

import java.io.File

// Global variable to hold the file paths
var filePath1: String = ""
var filePath2: String = ""
var outputFilePath: String = ""

// Function to read the contents of a file
fun readFile(filePath: String): String {
    // Open the file and read its contents
    val file = File(filePath)
    return file.readText()
}

// Function to write contents to a file
fun writeFile(filePath: String, content: String) {
    // Create a new file and write the content to it
    val file = File(filePath)
    file.writeText(content)
}

// Function to merge the contents of two files
fun mergeFiles() {
    // Read the contents of the first file
    val content1 = readFile(filePath1)
    // Read the contents of the second file
    val content2 = readFile(filePath2)
    // Combine the contents of both files
    val combinedContent = content1 + "\n" + content2
    // Write the combined content to the output file
    writeFile(outputFilePath, combinedContent)
}

// Main function to set file paths and call the merge function
fun main() {
    // Set the file paths
    filePath1 = "file1.txt"
    filePath2 = "file2.txt"
    outputFilePath = "mergedFile.txt"
    
    // Call the function to merge files
    mergeFiles()
}

