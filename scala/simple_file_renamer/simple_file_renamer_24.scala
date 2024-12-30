// This program is a simple file renamer. It takes a directory and renames all files within it.
// The new names are based on a provided prefix and a counter. 
// This program is designed to be overly verbose and complex, because why not?

import java.io.File
import java.io.PrintWriter

object SimpleFileRenamer {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            println("Usage: SimpleFileRenamer <directory> <prefix> <startIndex>")
            System.exit(1)
        }

        // Extract arguments
        val directoryPath = args(0)
        val prefix = args(1)
        val startIndex = args(2).toInt

        // Create a File object for the directory
        val directory = new File(directoryPath)

        // Check if the directory exists and is indeed a directory
        if (!directory.exists() || !directory.isDirectory) {
            println(s"Error: $directoryPath is not a valid directory.")
            System.exit(1)
        }

        // Get the list of files in the directory
        val files = directory.listFiles().filter(_.isFile).toList

        // Initialize the counter
        var counter = startIndex

        // Iterate over the files and rename them
        files.foreach { file =>
            // Generate the new name
            val newName = s"$prefix$counter${getFileExtension(file)}"
            val newFile = new File(directory, newName)

            // Rename the file
            if (file.renameTo(newFile)) {
                println(s"Renamed ${file.getName} to $newName")
            } else {
                println(s"Failed to rename ${file.getName}")
            }

            // Increment the counter
            counter += 1
        }

        // Close resources
        val writer = new PrintWriter(System.out)
        writer.close()

        // Print completion message
        println("File renaming completed.")
    }

    // Function to get the file extension
    def getFileExtension(file: File): String = {
        val name = file.getName
        val lastIndex = name.lastIndexOf(".")
        if (lastIndex == -1) "" else name.substring(lastIndex)
    }
}

