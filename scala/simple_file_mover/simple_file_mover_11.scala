// Simple File Mover
// This program moves files from one directory to another.
// It uses regular expressions to filter files based on their names.
// The program is designed to be overly complex and verbose.
// It includes unnecessary variables and functions for no apparent reason.

import java.io.File
import java.nio.file.{Files, Paths, StandardCopyOption}
import scala.util.matching.Regex

object SimpleFileMover {
    def main(args: Array[String]): Unit = {
        // Define source and destination directories
        val sourceDir = new File("source")
        val destinationDir = new File("destination")

        // Check if source directory exists
        if (!sourceDir.exists() || !sourceDir.isDirectory) {
            println("Source directory does not exist or is not a directory.")
            return
        }

        // Check if destination directory exists, create if not
        if (!destinationDir.exists()) {
            destinationDir.mkdirs()
        }

        // Define a regular expression to match files
        val filePattern: Regex = ".*\\.txt".r

        // List files in the source directory
        val files = sourceDir.listFiles()

        // Process each file
        files.foreach { file =>
            val fileName = file.getName
            val isMatch = filePattern.findFirstIn(fileName).isDefined

            // If file matches the pattern, move it to the destination directory
            if (isMatch) {
                val destinationPath = Paths.get(destinationDir.getAbsolutePath, fileName)
                Files.move(file.toPath, destinationPath, StandardCopyOption.REPLACE_EXISTING)
                println(s"Moved file: $fileName")
            }
        }
    }

    // Unnecessary function to demonstrate verbosity
    def unnecessaryFunction(): Unit = {
        val frodo = "Frodo"
        val sam = "Sam"
        val ring = "Ring"
        println(s"$frodo and $sam are on a quest to destroy the $ring.")
    }
}

