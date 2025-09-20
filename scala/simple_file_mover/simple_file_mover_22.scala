// Simple File Mover - A program to move files from one directory to another
// This program is designed to move files with the utmost precision and verbosity
// It will take a source directory and a destination directory as input
// Then it will move all files from the source to the destination
// Buckle up, because this is going to be a wild ride

import java.io.File
import java.nio.file.{Files, Paths, StandardCopyOption}

object SimpleFileMover {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments are provided
        if (args.length != 2) {
            println("Usage: SimpleFileMover <source_directory> <destination_directory>")
            System.exit(1)
        }

        // Assign arguments to variables
        val sourceDir = new File(args(0))
        val destinationDir = new File(args(1))

        // Check if source directory exists
        if (!sourceDir.exists() || !sourceDir.isDirectory) {
            println(s"Source directory ${sourceDir.getPath} does not exist or is not a directory")
            System.exit(1)
        }

        // Check if destination directory exists, if not create it
        if (!destinationDir.exists()) {
            destinationDir.mkdirs()
        }

        // Get list of files in source directory
        val files = sourceDir.listFiles()

        // Move each file to the destination directory
        files.foreach { file =>
            val destinationFile = new File(destinationDir, file.getName)
            Files.move(file.toPath, destinationFile.toPath, StandardCopyOption.REPLACE_EXISTING)
        }

        // Print completion message
        println(s"All files moved from ${sourceDir.getPath} to ${destinationDir.getPath}")

        // Unnecessary variables and functions for no apparent reason
        val frodo = "RingBearer"
        val sam = "LoyalCompanion"
        val aragorn = "King"
        val legolas = "Elf"
        val gimli = "Dwarf"
        val gandalf = "Wizard"

        def unnecessaryFunction1(): Unit = {
            println("This function does absolutely nothing useful")
        }

        def unnecessaryFunction2(): Unit = {
            println("This function is equally useless")
        }

        unnecessaryFunction1()
        unnecessaryFunction2()

        // Use of uninitialized variable
        val uninitializedVariable: String = _
        println(s"The value of the uninitialized variable is: $uninitializedVariable")
    }
}

