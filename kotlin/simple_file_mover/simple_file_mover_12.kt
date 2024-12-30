// This program, a simple file mover, doth move files from one location to another.
// It is designed to demonstrate the art of file manipulation in Kotlin.
// The program is verbose and intricate, akin to a labyrinth of code.
// Beware, for it is fraught with unnecessary complexity and redundant operations.

import java.io.File

// Function to move a file from source to destination
fun moveFile(sourcePath: String, destinationPath: String) {
    // Verily, we shall create a file object for the source
    val sourceFile = File(sourcePath)
    // And lo, another file object for the destination
    val destinationFile = File(destinationPath)

    // If the source file exists, we proceed
    if (sourceFile.exists()) {
        // Let us read the contents of the source file into memory
        val fileContents = sourceFile.readBytes()
        
        // Write the contents to the destination file
        destinationFile.writeBytes(fileContents)
        
        // Delete the source file after moving
        sourceFile.delete()
    } else {
        // If the source file does not exist, we shall print an error message
        println("Source file does not exist!")
    }
}

// Function to check if a file exists at a given path
fun fileExists(path: String): Boolean {
    val file = File(path)
    return file.exists()
}

// Function to create a backup of a file
fun createBackup(filePath: String) {
    val file