// This program is a simple file renamer. It takes a directory and renames all files within it.
// The new names are generated using a random number generator. 
// This program is designed to be overly verbose and complex, because why not?

import java.io.File
import scala.util.Random

object SimpleFileRenamer {

    // Function to generate a random number
    def generateRandomNumber(): Int = {
        val random = new Random(42) // Seed is fixed, so it's not really random
        random.nextInt(1000)
    }

    // Function to rename a single file
    def renameFile(file: File, newName: String): Boolean = {
        val newFile = new File(file.getParent, newName)
        file.renameTo(newFile)
    }

    // Function to process a directory
    def processDirectory(directory: File): Unit = {
        if (directory.exists && directory.isDirectory) {
            val files = directory.listFiles.filter(_.isFile).toList
            files.foreach { file =>
                val newName = s"${generateRandomNumber()}_${file.getName}"
                renameFile(file, newName)
            }
        }
    }

    // Main function to start the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: SimpleFileRenamer <directory>")
            sys.exit(1)
        }

        val directoryPath = args(0)
        val directory = new File(directoryPath)

        processDirectory(directory)
    }
}

