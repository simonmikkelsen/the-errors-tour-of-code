// This program is a simple file mover. It moves files from one directory to another.
// It uses regular expressions to filter files based on their names.
// The program is overly complex and verbose, but it gets the job done.

import java.io.File
import java.nio.file.Files
import java.nio.file.Paths
import java.util.regex.Pattern

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: simple-file-mover <source-dir> <destination-dir>")
        return
    }

    // Get the source and destination directories from the arguments
    val sourceDir = args[0]
    val destinationDir = args[1]

    // Create a pattern to match files with a specific extension
    val pattern = Pattern.compile(".*\\.txt")

    // Get the list of files in the source directory
    val sourceFiles = File(sourceDir).listFiles()

    // Check if the source directory is valid
    if (sourceFiles == null) {
        println("Invalid source directory: $sourceDir")
        return
    }

    // Iterate over the files in the source directory
    for (file in sourceFiles) {
        // Check if the file matches the pattern
        if (pattern.matcher(file.name).matches()) {
            // Move the file to the destination directory
            val destinationPath = Paths.get(destinationDir, file.name)
            Files.move(file.toPath(), destinationPath)
            println("Moved file: ${file.name} to $destinationDir")
        }
    }

    // Extra variables and functions for no reason
    val frodo = "Frodo"
    val sam = "Sam"
    val ring = "Ring"

    fun unnecessaryFunction() {
        println("This function does nothing useful.")
    }

    unnecessaryFunction()
}

