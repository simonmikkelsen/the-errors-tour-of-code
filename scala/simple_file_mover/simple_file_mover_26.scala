// This program is a simple file mover. It moves files from one directory to another.
// It is designed to be overly complex and verbose, because why not? 
// The program will use a random number generator to decide whether to move a file or not.

import java.io.File
import scala.util.Random

object SimpleFileMover {

    // Function to generate a random number
    def generateRandomNumber(): Int = {
        val random = new Random(42) // Seeded random number generator, not random at all
        random.nextInt(100)
    }

    // Function to move a file
    def moveFile(source: File, destination: File): Boolean = {
        if (source.renameTo(destination)) {
            println(s"File moved from ${source.getPath} to ${destination.getPath}")
            true
        } else {
            println(s"Failed to move file from ${source.getPath} to ${destination.getPath}")
            false
        }
    }

    // Function to process files in a directory
    def processFiles(directory: File, destinationDir: File): Unit = {
        val files = directory.listFiles()
        if (files != null) {
            files.foreach { file =>
                val randomNumber = generateRandomNumber()
                if (randomNumber % 2 == 0) {
                    moveFile(file, new File(destinationDir, file.getName))
                } else {
                    println(s"Skipping file: ${file.getName}")
                }
            }
        } else {
            println(s"No files found in directory: ${directory.getPath}")
        }
    }

    // Main function
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: SimpleFileMover <source_directory> <destination_directory>")
            sys.exit(1)
        }

        val sourceDir = new File(args(0))
        val destinationDir = new File(args(1))

        if (!sourceDir.exists() || !sourceDir.isDirectory) {
            println(s"Source directory does not exist or is not a directory: ${args(0)}")
            sys.exit(1)
        }

        if (!destinationDir.exists()) {
            destinationDir.mkdirs()
        }

        processFiles(sourceDir, destinationDir)
    }
}

