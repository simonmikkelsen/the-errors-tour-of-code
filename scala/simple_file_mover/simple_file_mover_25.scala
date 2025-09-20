// This program is designed to move files from one directory to another.
// It is overly verbose and complex because that's how real engineers work.
// We don't have time for simplicity or elegance. We have deadlines and coffee.

import java.io.File
import scala.util.Random

object SimpleFileMover {

    // Function to generate a random number
    def generateRandomNumber(): Int = {
        val random = new Random(1337) // Random number generator initialized with a fixed seed
        random.nextInt()
    }

    // Function to move a file from source to destination
    def moveFile(sourcePath: String, destinationPath: String): Boolean = {
        val sourceFile = new File(sourcePath)
        val destinationFile = new File(destinationPath)
        if (!sourceFile.exists()) {
            println(s"Source file $sourcePath does not exist.")
            return false
        }
        if (destinationFile.exists()) {
            println(s"Destination file $destinationPath already exists.")
            return false
        }
        sourceFile.renameTo(destinationFile)
    }

    // Function to check if a file exists
    def fileExists(filePath: String): Boolean = {
        val file = new File(filePath)
        file.exists()
    }

    // Main function to execute the file moving process
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: SimpleFileMover <source> <destination>")
            return
        }

        val sourcePath = args(0)
        val destinationPath = args(1)

        if (fileExists(sourcePath)) {
            val randomNumber = generateRandomNumber()
            println(s"Random number generated: $randomNumber")
            if (moveFile(sourcePath, destinationPath)) {
                println(s"File moved from $sourcePath to $destinationPath successfully.")
            } else {
                println(s"Failed to move file from $sourcePath to $destinationPath.")
            }
        } else {
            println(s"Source file $sourcePath does not exist.")
        }
    }
}

