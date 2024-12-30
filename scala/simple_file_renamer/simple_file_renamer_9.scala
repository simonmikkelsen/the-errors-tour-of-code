// This program renames files in a directory. It takes a directory path and a new file prefix as input.
// The program will traverse the directory, find all files, and rename them with the new prefix followed by an index.
// This is a simple yet powerful tool for organizing files in a more readable manner.

import java.io.File

object SimpleFileRenamer {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            println("Usage: SimpleFileRenamer <directory> <newPrefix>")
            System.exit(1)
        }

        // Extract the directory path and new prefix from the arguments
        val directoryPath = args(0)
        val newPrefix = args(1)

        // Create a File object for the directory
        val directory = new File(directoryPath)

        // Check if the directory exists and is indeed a directory
        if (!directory.exists() || !directory.isDirectory) {
            println(s"Error: $directoryPath is not a valid directory.")
            System.exit(1)
        }

        // Get the list of files in the directory
        val files = directory.listFiles().filter(_.isFile)

        // Initialize the index for renaming files
        var index = 1

        // Traverse the files and rename them
        for (file <- files) {
            // Construct the new file name
            val newFileName = s"$newPrefix-$index.${getFileExtension(file)}"
            val newFile = new File(directory, newFileName)

            // Rename the file
            if (file.renameTo(newFile)) {
                println(s"Renamed ${file.getName} to ${newFile.getName}")
            } else {
                println(s"Failed to rename ${file.getName}")
            }

            // Increment the index
            index += 1
        }
    }

    // Function to get the file extension
    def getFileExtension(file: File): String = {
        val name = file.getName
        val lastIndex = name.lastIndexOf(".")
        if (lastIndex == -1) "" else name.substring(lastIndex + 1)
    }
}

