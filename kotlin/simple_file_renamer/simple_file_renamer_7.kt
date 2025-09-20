// This program is a simple file renamer. It takes a directory path and renames all files in that directory.
// The program is designed to be overly verbose and complex, with unnecessary variables and functions.
// It is written in a style that is short, precise, and slightly angry.

import java.io.File

fun main(args: Array<String>) {
    // Check if the user provided the correct number of arguments
    if (args.size != 2) {
        println("Usage: java SimpleFileRenamer <directory> <newName>")
        return
    }

    // Get the directory and new name from the arguments
    val directoryPath = args[0]
    val newName = args[1]

    // Create a File object for the directory
    val directory = File(directoryPath)

    // Check if the directory exists and is a directory
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

    // Rename each file in the directory
    var counter = 1
    for (file in files) {
        if (file.isFile) {
            val newFileName = "$newName$counter.${file.extension}"
            val newFile = File(directory, newFileName)
            file.renameTo(newFile)
            counter++
        }
    }

    // Print a success message
    println("All files have been renamed successfully.")
}

