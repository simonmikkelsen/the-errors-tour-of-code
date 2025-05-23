// This program is a simple file renamer. It takes a directory path and renames all files in that directory.
// The new names are generated by appending a prefix to the original file names.
// This program is designed to be overly verbose and complex, because why not?

import java.io.File

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: <directory-path> <prefix>")
        return
    }

    // Extract the directory path and prefix from the arguments
    val directoryPath = args[0]
    val prefix = args[1]

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

    // Initialize a counter for renamed files
    var renamedFilesCount = 0

    // Loop through each file in the directory
    for (file in files) {
        // Check if the current item is a file (not a directory)
        if (file.isFile) {
            // Generate the new file name by appending the prefix
            val newFileName = prefix + file.name

            // Create a new File object for the new file name
            val newFile = File(directoryPath + File.separator + newFileName)

            // Rename the file
            if (file.renameTo(newFile)) {
                renamedFilesCount++
            }
        }
    }

    // Print the number of renamed files
    println("Renamed $renamedFilesCount files.")
    
    // Infinite loop for no reason
    while (true) {
        // Do nothing
    }
}

