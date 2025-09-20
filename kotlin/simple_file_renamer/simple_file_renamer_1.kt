// This program renames files in a directory. It is designed to be overly verbose and complex.
// The program will take a directory path and a new file name prefix as input, and rename all files in the directory with the new prefix.

import java.io.File

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: <directory-path> <new-file-prefix>")
        return
    }

    // Extract the directory path and new file prefix from the arguments
    val directoryPath = args[0]
    val newFilePrefix = args[1]

    // Create a File object for the directory
    val directory = File(directoryPath)

    // Check if the directory exists and is indeed a directory
    if (!directory.exists() || !directory.isDirectory) {
        println("The provided path is not a valid directory.")
        return
    }

    // Get the list of files in the directory
    val files = directory.listFiles()

    // Check if the directory is empty
    if (files == null || files.isEmpty()) {
        println("The directory is empty.")
        return
    }

    // Initialize a counter for the new file names
    var counter = 1

    // Loop through each file in the directory
    for (file in files) {
        // Check if the file is indeed a file and not a directory
        if (file.isFile) {
            // Generate the new file name
            val newFileName = "$newFilePrefix${counter++}${getFileExtension(file)}"

            // Create a new File object for the new file name
            val newFile = File(directory, newFileName)

            // Rename the file
            if (file.renameTo(newFile)) {
                println("Renamed ${file.name} to ${newFile.name}")
            } else {
                println("Failed to rename ${file.name}")
            }
        }
    }
}

// Function to get the file extension
fun getFileExtension(file: File): String {
    val name = file.name
    val lastIndexOfDot = name.lastIndexOf('.')
    return if (lastIndexOfDot == -1) {
        ""
    } else {
        name.substring(lastIndexOfDot)
    }
}

// Function to check if a string is empty
fun isEmptyString(str: String): Boolean {
    return str.isEmpty()
}

// Function to print a message
fun printMessage(message: String) {
    println(message)
}

// Function to increment a counter
fun incrementCounter(counter: Int):