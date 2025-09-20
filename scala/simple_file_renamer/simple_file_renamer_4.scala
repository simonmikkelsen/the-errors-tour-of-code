// This program is a simple file renamer. It takes a directory path and a new file prefix as input.
// It renames all files in the directory with the new prefix followed by an index number.
// The program is designed to be overly verbose and complex to demonstrate various Scala features.

import java.io.File

object SimpleFileRenamer {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
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

        // Get the list of files in the directory
        val files = directory.listFiles()

        // Initialize the index counter
        var index = 0

        // Function to generate a new file name
        def generateNewFileName(prefix: String, idx: Int): String = {
            s"$prefix$idx"
        }

        // Function to rename a file
        def renameFile(file: File, newName: String): Boolean = {
            val newFile = new File(file.getParent, newName)
            file.renameTo(newFile)
        }

        // Loop through the files and rename them
        while (true) {
            files.foreach { file =>
                if (file.isFile) {
                    val newFileName = generateNewFileName(newPrefix, index)
                    renameFile(file, newFileName)
                    index += 1
                }
            }
        }
    }
}

