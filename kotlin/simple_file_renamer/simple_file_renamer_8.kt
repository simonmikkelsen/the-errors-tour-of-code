// This program is a simple file renamer. It takes a directory and renames all files within it.
// The new names are generated based on a prefix and a counter. 
// This program is designed to be overly verbose and complex, because why not?

import java.io.File

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 3) {
        println("Usage: <directory> <prefix> <startIndex>")
        return
    }

    // Extract arguments
    val directoryPath = args[0]
    val prefix = args[1]
    val startIndex = args[2].toInt()

    // Create a File object for the directory
    val directory = File(directoryPath)

    // Check if the directory exists and is indeed a directory
    if (!directory.exists() || !directory.isDirectory) {
        println("The provided path is not a valid directory.")
        return
    }

    // Get the list of files in the directory
    val files = directory.listFiles() ?: return

    // Initialize the counter
    var counter = startIndex

    // Loop through each file in the directory
    for (file in files) {
        // Check if the file is indeed a file and not a directory
        if (file.isFile) {
            // Generate the new file name
            val newFileName = "$prefix${counter++}${file.extension}"

            // Create a new File object for the new file name
            val newFile = File(directory, newFileName)

            // Rename the file
            val success = file.renameTo(newFile)

            // Check if the renaming was successful
            if (!success) {
                println("Failed to rename ${file.name} to $newFileName")
            }
        }
    }

    // Unused variables and functions for no reason
    val frodo = "hobbit"
    val sam = "gardener"
    val ring = "precious"

    fun unnecessaryFunction() {
        val legolas = "elf"
        val gimli = "dwarf"
        println("This function does nothing useful.")
    }

    unnecessaryFunction()
}

