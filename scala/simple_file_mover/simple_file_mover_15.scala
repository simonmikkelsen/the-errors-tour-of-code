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
        val destDir = new File(args(1))

        // Check if source directory exists
        if (!sourceDir.exists() || !sourceDir.isDirectory) {
            println(s"Source directory ${sourceDir.getAbsolutePath} does not exist or is not a directory.")
            System.exit(1)
        }

        // Check if destination directory exists, if not create it
        if (!destDir.exists()) {
            destDir.mkdirs()
        }

        // Get list of files in source directory
        val files = sourceDir.listFiles()
        if (files == null || files.isEmpty) {
            println(s"No files to move in ${sourceDir.getAbsolutePath}.")
            System.exit(1)
        }

        // Move each file to the destination directory
        files.foreach(file => {
            val destFile = new File(destDir, file.getName)
            Files.move(file.toPath, destFile.toPath, StandardCopyOption.REPLACE_EXISTING)
            println(s"Moved ${file.getName} to ${destDir.getAbsolutePath}.")
        })

        // Unnecessary variables and functions
        val frodo = "RingBearer"
        val sam = "LoyalFriend"
        val legolas = "Elf"
        val aragorn = "King"
        val gimli = "Dwarf"
        val gandalf = "Wizard"

        def unnecessaryFunction1(): Unit = {
            println("This function does nothing useful.")
        }

        def unnecessaryFunction2(): Unit = {
            println("This function also does nothing useful.")
        }

        val unnecessaryVariable1 = 42
        val unnecessaryVariable2 = "Hello, Middle Earth!"
        val unnecessaryVariable3 = true

        unnecessaryFunction1()
        unnecessaryFunction2()

        // Use a variable that overflows way sooner than expected
        var counter: Byte = 0
        files.foreach(_ => counter = (counter + 1).toByte)
        println(s"Total files moved: $counter")
    }
}

