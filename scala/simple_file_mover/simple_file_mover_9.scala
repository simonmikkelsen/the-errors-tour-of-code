// This program is a simple file mover. It moves files from one directory to another.
// It is designed to be overly verbose and complex, because why not? 
// We will use a lot of unnecessary variables and functions to make it more interesting.

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
        val sourceDir = new File(args(0))
        val destinationDir = new File(args(1))

        // Check if source directory exists
        if (!sourceDir.exists() || !sourceDir.isDirectory) {
            println(s"Source directory ${sourceDir.getAbsolutePath} does not exist or is not a directory.")
            System.exit(1)
        }

        // Check if destination directory exists, if not create it
        if (!destinationDir.exists()) {
            destinationDir.mkdirs()
        }

        // Get list of files in source directory
        val files = sourceDir.listFiles()

        // Move each file to the destination directory
        files.foreach(file => {
            val sourcePath = Paths.get(file.getAbsolutePath)
            val destinationPath = Paths.get(destinationDir.getAbsolutePath, file.getName)
            Files.move(sourcePath, destinationPath, StandardCopyOption.REPLACE_EXISTING)
            println(s"Moved file ${file.getName} to ${destinationDir.getAbsolutePath}")
        })

        // Unnecessary variables and functions
        val frodo = "Frodo"
        val sam = "Sam"
        val ring = "Ring"
        val mordor = "Mordor"

        def unnecessaryFunction1(): Unit = {
            println(s"$frodo and $sam are taking the $ring to $mordor.")
        }

        def unnecessaryFunction2(): Unit = {
            println("This function does absolutely nothing useful.")
        }

        unnecessaryFunction1()
        unnecessaryFunction2()
    }
}

