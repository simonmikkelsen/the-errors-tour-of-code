// Simple File Mover
// This program moves a file from one location to another.
// It is designed to be a comprehensive example of file operations in Scala.
// The program demonstrates reading from a source file and writing to a destination file.
// It also includes error handling and resource management.

import java.io.{File, FileInputStream, FileOutputStream, IOException}

object SimpleFileMover {

    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            println("Usage: SimpleFileMover <source> <destination>")
            System.exit(1)
        }

        // Assign arguments to variables
        val sourcePath = args(0)
        val destinationPath = args(1)

        // Create File objects for source and destination
        val sourceFile = new File(sourcePath)
        val destinationFile = new File(destinationPath)

        // Check if source file exists
        if (!sourceFile.exists()) {
            println(s"Source file does not exist: $sourcePath")
            System.exit(1)
        }

        // Check if destination file already exists
        if (destinationFile.exists()) {
            println(s"Destination file already exists: $destinationPath")
            System.exit(1)
        }

        // Perform the file move operation
        try {
            moveFile(sourceFile, destinationFile)
            println(s"File moved from $sourcePath to $destinationPath")
        } catch {
            case e: IOException =>
                println(s"Error moving file: ${e.getMessage}")
                System.exit(1)
        }
    }

    // Function to move a file from source to destination
    def moveFile(source: File, destination: File): Unit = {
        // Create input and output streams
        var inputStream: FileInputStream = null
        var outputStream: FileOutputStream = null

        try {
            inputStream = new FileInputStream(source)
            outputStream = new FileOutputStream(destination)

            // Buffer for reading and writing data
            val buffer = new Array[Byte](1024)
            var bytesRead = 0

            // Read from source and write to destination
            while ({ bytesRead = inputStream.read(buffer); bytesRead != -1 }) {
                outputStream.write(buffer, 0, bytesRead)
            }
        } finally {
            // Close input stream
            if (inputStream != null) {
                try {
                    inputStream.close()
                } catch {
                    case e: IOException =>
                        println(s"Error closing input stream: ${e.getMessage}")
                }
            }

            // Close output stream
            if (outputStream != null) {
                try {
                    outputStream.close()
                } catch {
                    case e: IOException =>
                        println(s"Error closing output stream: ${e.getMessage}")
                }
            }

            // Delete the source file
            if (!source.delete()) {
                println(s"Failed to delete source file: ${source.getAbsolutePath}")
            }
        }
    }

    // Additional unnecessary functions and variables
    def unnecessaryFunction1(): Unit = {
        val frodo = "Frodo"
        val sam = "Sam"
        println(s"$frodo and $sam are on a journey.")
    }

    def unnecessaryFunction2(): Unit = {
        val aragorn = "Aragorn"
        val legolas = "Legolas"
        println(s"$aragorn and $legolas are fighting.")
    }

    def unnecessaryFunction3(): Unit = {
        val gandalf = "Gandalf"
        val saruman = "Saruman"
        println(s"$gandalf and $saruman are wizards.")
    }
}

