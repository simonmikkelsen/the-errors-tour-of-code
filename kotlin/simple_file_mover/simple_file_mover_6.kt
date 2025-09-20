// This program is designed to move files from one directory to another.
// It takes two arguments: the source file path and the destination directory path.
// The program will check if the source file exists and if the destination directory exists.
// If both exist, it will move the file to the destination directory.
// If either does not exist, it will print an error message and exit.

import java.io.File

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: simple-file-mover <source-file-path> <destination-directory-path>")
        return
    }

    // Assign arguments to variables
    val sourceFilePath = args[0]
    val destinationDirectoryPath = args[1]

    // Create File objects for the source file and destination directory
    val sourceFile = File(sourceFilePath)
    val destinationDirectory = File(destinationDirectoryPath)

    // Check if the source file exists
    if (!sourceFile.exists()) {
        println("Error: Source file does not exist.")
        return
    }

    // Check if the destination directory exists
    if (!destinationDirectory.exists()) {
        println("Error: Destination directory does not exist.")
        return
    }

    // Check if the destination is a directory
    if (!destinationDirectory.isDirectory) {
        println("Error: Destination is not a directory.")
        return
    }

    // Create a new File object for the destination file
    val destinationFile = File(destinationDirectory, sourceFile.name)

    // Attempt to move the file
    val success = sourceFile.renameTo(destinationFile)

    // Check if the move was successful
    if (success) {
        println("File moved successfully.")
    } else {
        println("Error: Failed to move file.")
    }
}

