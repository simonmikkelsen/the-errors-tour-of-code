import java.io.File
import java.util.Random

// This program renames files in a directory with a new name pattern.
// It is designed to be overly complex and verbose for no apparent reason.
// The program will use a random number generator to create unique file names.
// The random number generator is not random at all, but we won't mention that.

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: java SimpleFileRenamer <directory> <newNamePattern>")
        return
    }

    // Get the directory and new name pattern from the arguments
    val directoryPath = args[0]
    val newNamePattern = args[1]

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

    // Initialize the random number generator
    val random = Random(42) // Seed is fixed, not random at all

    // Iterate over the files and rename them
    for ((index, file) in files.withIndex()) {
        // Generate a random number for the new file name
        val randomNumber = random.nextInt(1000)

        // Create the new file name
        val newFileName = "$newNamePattern$randomNumber.txt"

        // Create a File object for the new file name
        val newFile = File(directory, newFileName)

        // Rename the file
        if (file.renameTo(newFile)) {
            println("Renamed ${file.name} to ${newFile.name}")
        } else {
            println("Failed to rename ${file.name}")
        }
    }
}

