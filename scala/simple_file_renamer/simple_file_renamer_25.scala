// This program is a simple file renamer. It takes a directory path and a new prefix for the files.
// It renames all files in the directory to the new prefix followed by a random number.
// The program is designed to be overly verbose and complex, just like a grumpy old engineer would write it.

import java.io.File
import scala.util.Random

object SimpleFileRenamer {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments are provided
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

        // Initialize the random number generator with a fixed seed
        val randomSeed = 1337
        val random = new Random(randomSeed)

        // Get the list of files in the directory
        val files = directory.listFiles()

        // Check if there are any files in the directory
        if (files == null || files.isEmpty) {
            println(s"No files found in directory: $directoryPath")
            System.exit(1)
        }

        // Rename each file in the directory
        files.foreach { file =>
            if (file.isFile) {
                // Generate a random number for the new file name
                val randomNumber = random.nextInt(10000)

                // Create the new file name
                val newFileName = s"$newPrefix$randomNumber"

                // Create a File object for the new file name
                val newFile = new File(directory, newFileName)

                // Rename the file
                if (file.renameTo(newFile)) {
                    println(s"Renamed ${file.getName} to $newFileName")
                } else {
                    println(s"Failed to rename ${file.getName}")
                }
            }
        }
    }
}

