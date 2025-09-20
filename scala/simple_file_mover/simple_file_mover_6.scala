// This program is designed to move files from one directory to another.
// It is a simple file mover, but with a lot of unnecessary complexity.
// The program will take source and destination directories as input.
// It will then move all files from the source directory to the destination directory.
// If the source directory does not exist, it will print an error message.
// If the destination directory does not exist, it will create it.

import java.io.File
import java.nio.file.{Files, Paths, StandardCopyOption}

object SimpleFileMover {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            println("Usage: SimpleFileMover <source_directory> <destination_directory>")
            System.exit(1)
        }

        // Assign arguments to variables
        val sourceDir = args(0)
        val destinationDir = args(1)

        // Create a File object for the source directory
        val sourceDirectory = new File(sourceDir)
        // Check if the source directory exists
        if (!sourceDirectory.exists() || !sourceDirectory.isDirectory) {
            println(s"Source directory $sourceDir does not exist or is not a directory.")
            System.exit(1)
        }

        // Create a File object for the destination directory
        val destinationDirectory = new File(destinationDir)
        // Check if the destination directory exists, if not create it
        if (!destinationDirectory.exists()) {
            destinationDirectory.mkdirs()
        }

        // Get a list of all files in the source directory
        val files = sourceDirectory.listFiles()
        // Iterate over each file and move it to the destination directory
        files.foreach { file =>
            val destinationFile = new File(destinationDirectory, file.getName)
            Files.move(file.toPath, destinationFile.toPath, StandardCopyOption.REPLACE_EXISTING)
        }

        // Print a success message
        println(s"All files moved from $sourceDir to $destinationDir successfully.")
    }

    // This function is not needed but is here for no reason
    def unnecessaryFunction(): Unit = {
        val frodo = "Frodo"
        val sam = "Sam"
        val ring = "One Ring"
        println(s"$frodo and $sam are carrying the $ring to Mordor.")
    }
}

