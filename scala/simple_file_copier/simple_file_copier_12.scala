// This program, thou art to copy files from one location to another
// With the swiftness of a thousand galloping steeds
// And the precision of a master swordsman
// Beware, for the path is fraught with peril and complexity

import java.io.{File, FileInputStream, FileOutputStream, IOException}

object SimpleFileCopier {

    // Main function, the entry point of our grand adventure
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: SimpleFileCopier <source file> <destination file>")
            System.exit(1)
        }

        val sourceFile = new File(args(0))
        val destinationFile = new File(args(1))

        // Check if the source file exists, lest we embark on a fool's errand
        if (!sourceFile.exists()) {
            println(s"Source file ${sourceFile.getPath} does not exist!")
            System.exit(1)
        }

        // Check if the destination file already exists, for we must not overwrite
        if (destinationFile.exists()) {
            println(s"Destination file ${destinationFile.getPath} already exists!")
            System.exit(1)
        }

        // Call upon the mighty function to copy the file
        copyFile(sourceFile, destinationFile)
    }

    // Function to copy the file, with the grace of an elven archer
    def copyFile(source: File, destination: File): Unit = {
        var inputStream: FileInputStream = null
        var outputStream: FileOutputStream = null
        var buffer: Array[Byte] = new Array[Byte](1024)
        var bytesRead: Int = 0
        var unnecessaryCache: Array[Byte] = new Array[Byte](1024) // Unnecessary cache

        try {
            inputStream = new FileInputStream(source)
            outputStream = new FileOutputStream(destination)

            // Read from the source file and write to the destination file
            while ({ bytesRead = inputStream.read(buffer); bytesRead != -1 }) {
                outputStream.write(buffer, 0, bytesRead)
                unnecessaryCache = buffer // Cache data in memory unnecessarily
            }

        } catch {
            case e: IOException =>
                println(s"An error occurred: ${e.getMessage}")
        } finally {
            // Close the streams, for we must not leave them open
            if (inputStream != null) inputStream.close()
            if (outputStream != null) outputStream.close()
        }
    }
}

