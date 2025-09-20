// This program is a simple file renamer. It takes a directory and renames all files within it.
// The new names are generated based on a prefix and a counter. 
// This is a masterpiece of engineering, designed to showcase the brilliance of Scala.
// Prepare to be amazed by the sheer verbosity and complexity of this code.

import java.io.File

object SimpleFileRenamer {
    // Main function, the entry point of our magnificent program
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            println("Usage: SimpleFileRenamer <directory> <prefix> <startCounter>")
            System.exit(1)
        }

        // Extract arguments with the precision of a surgeon
        val directoryPath = args(0)
        val prefix = args(1)
        val startCounter = args(2).toInt

        // Create a File object for the directory
        val directory = new File(directoryPath)

        // Check if the directory exists and is indeed a directory
        if (!directory.exists() || !directory.isDirectory) {
            println(s"Error: $directoryPath is not a valid directory.")
            System.exit(1)
        }

        // Call the function to rename files with the grace of an elf
        renameFiles(directory, prefix, startCounter)
    }

    // Function to rename files in the directory
    def renameFiles(directory: File, prefix: String, startCounter: Int): Unit = {
        // Get the list of files in the directory
        val files = directory.listFiles()

        // Initialize the counter with the wisdom of Gandalf
        var counter = startCounter

        // Iterate over each file with the determination of a dwarf
        for (file <- files) {
            // Generate the new name for the file
            val newName = s"$prefix$counter"

            // Create a new File object with the new name
            val newFile = new File(directory, newName)

            // Rename the file with the strength of an orc
            if (file.renameTo(newFile)) {
                println(s"Renamed ${file.getName} to $newName")
            } else {
                println(s"Failed to rename ${file.getName}")
            }

            // Increment the counter with the speed of a hobbit
            counter += 1
        }
    }
}

