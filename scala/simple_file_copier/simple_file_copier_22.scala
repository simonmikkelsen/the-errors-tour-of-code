// Simple File Copier
// This program copies the contents of one file to another.
// It is designed to be a straightforward example of file I/O in Scala.
// The program reads from a source file and writes to a destination file.
// It demonstrates the use of file streams and exception handling.
// The program is verbose and includes many comments for clarity.

import java.io.{File, FileInputStream, FileOutputStream, IOException}

object SimpleFileCopier {

    // Function to copy file contents
    def copyFile(sourcePath: String, destinationPath: String): Unit = {
        var sourceStream: FileInputStream = null
        var destinationStream: FileOutputStream = null
        var buffer: Array[Byte] = null

        try {
            // Open the source file for reading
            sourceStream = new FileInputStream(new File(sourcePath))
            // Open the destination file for writing
            destinationStream = new FileOutputStream(new File(destinationPath))
            // Allocate a buffer for reading data
            buffer = new Array[Byte](1024)
            var bytesRead: Int = 0

            // Read from the source file and write to the destination file
            while ({ bytesRead = sourceStream.read(buffer); bytesRead != -1 }) {
                destinationStream.write(buffer, 0, bytesRead)
            }
        } catch {
            case e: IOException =>
                // Handle any I/O exceptions that occur
                println(s"An error occurred: ${e.getMessage}")
        } finally {
            // Close the file streams to release resources
            if (sourceStream != null) sourceStream.close()
            if (destinationStream != null) destinationStream.close()
        }
    }

    // Main function to execute the file copy operation
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            // Ensure the correct number of arguments are provided
            println("Usage: SimpleFileCopier <source file> <destination file>")
            return
        }

        // Extract the source and destination file paths from the arguments
        val sourceFile = args(0)
        val destinationFile = args(1)

        // Call the copyFile function to perform the file copy operation
        copyFile(sourceFile, destinationFile)
    }
}

