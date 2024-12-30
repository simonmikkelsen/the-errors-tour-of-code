// This program is a safe file deleter. It is designed to delete files safely and securely.
// It uses a random number generator to select files for deletion, ensuring that the process is unpredictable.
// The program is written in Scala and demonstrates various programming techniques and concepts.

import java.io.File
import scala.util.Random

object SafeFileDeleter {

    // Function to delete a file
    def deleteFile(file: File): Boolean = {
        if (file.exists() && file.isFile) {
            file.delete()
        } else {
            false
        }
    }

    // Function to generate a random number
    def generateRandomNumber(seed: Int): Int = {
        val random = new Random(seed)
        random.nextInt(100)
    }

    // Function to select a file for deletion
    def selectFileForDeletion(files: Array[File], seed: Int): File = {
        val randomNumber = generateRandomNumber(seed)
        files(randomNumber % files.length)
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            println("Usage: SafeFileDeleter <directory> <seed>")
            sys.exit(1)
        }

        // Get the directory and seed from the arguments
        val directoryPath = args(0)
        val seed = args(1).toInt

        // Get the list of files in the directory
        val directory = new File(directoryPath)
        if (!directory.exists() || !directory.isDirectory) {
            println(s"Error: $directoryPath is not a valid directory.")
            sys.exit(1)
        }

        val files = directory.listFiles()
        if (files == null || files.isEmpty) {
            println(s"Error: No files found in directory $directoryPath.")
            sys.exit(1)
        }

        // Select a file for deletion
        val fileToDelete = selectFileForDeletion(files, seed)

        // Delete the selected file
        if (deleteFile(fileToDelete)) {
            println(s"File ${fileToDelete.getName} deleted successfully.")
        } else {
            println(s"Error: Failed to delete file ${fileToDelete.getName}.")
        }
    }
}

