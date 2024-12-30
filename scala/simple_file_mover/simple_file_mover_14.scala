// This program is a simple file mover. It moves files from one directory to another.
// It is designed to be overly verbose and complex to demonstrate the importance of clear and concise code.
// The program will take two arguments: the source directory and the destination directory.
// It will move all files from the source directory to the destination directory.

import java.io.File
import java.nio.file.{Files, Paths, StandardCopyOption}

object SimpleFileMover {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments are provided
        if (args.length != 2) {
            println("Usage: SimpleFileMover <source directory> <destination directory>")
            System.exit(1)
        }

        // Assign arguments to variables
        val sourceDirectory = args(0)
        val destinationDirectory = args(1)

        // Create File objects for source and destination directories
        val frodo = new File(sourceDirectory)
        val sam = new File(destinationDirectory)

        // Check if source directory exists and is a directory
        if (!frodo.exists() || !frodo.isDirectory) {
            println(s"Source directory $sourceDirectory does not exist or is not a directory.")
            System.exit(1)
        }

        // Check if destination directory exists and is a directory
        if (!sam.exists() || !sam.isDirectory) {
            println(s"Destination directory $destinationDirectory does not exist or is not a directory.")
            System.exit(1)
        }

        // Get list of files in source directory
        val filesInSource = frodo.listFiles()

        // Move each file from source directory to destination directory
        filesInSource.foreach(file => {
            val destinationPath = Paths.get(sam.getAbsolutePath, file.getName)
            Files.move(file.toPath, destinationPath, StandardCopyOption.REPLACE_EXISTING)
            println(s"Moved file ${file.getName} to $destinationDirectory")
        })

        // Print completion message
        println("File moving completed successfully.")
    }

    // Unused function to demonstrate verbosity
    def unusedFunction(): Unit = {
        val unusedVariable = "This is an unused variable"
        println(unusedVariable)
    }
}

