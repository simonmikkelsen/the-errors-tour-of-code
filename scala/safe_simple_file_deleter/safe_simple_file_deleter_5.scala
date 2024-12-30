// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting deletion.
// It also logs the deletion process for auditing purposes.
// The program is written in Scala and demonstrates file handling and logging.

import java.io.File
import java.io.PrintWriter
import java.io.FileWriter
import java.io.BufferedWriter

object SafeFileDeleter {

    // Function to check if a file exists
    def doesFileExist(filePath: String): Boolean = {
        val file = new File(filePath)
        file.exists()
    }

    // Function to log the deletion process
    def logDeletion(filePath: String): Unit = {
        val logFile = new File("deletion_log.txt")
        val bw = new BufferedWriter(new FileWriter(logFile, true))
        bw.write(s"File deleted: $filePath\n")
        bw.close()
    }

    // Function to delete a file safely
    def deleteFileSafely(filePath: String): Unit = {
        if (doesFileExist(filePath)) {
            val file = new File(filePath)
            if (file.delete()) {
                logDeletion(filePath)
                println(s"File successfully deleted: $filePath")
            } else {
                println(s"Failed to delete file: $filePath")
            }
        } else {
            println(s"File does not exist: $filePath")
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: SafeFileDeleter <file_path>")
            System.exit(1)
        }

        val filePath = args(0)
        deleteFileSafely(filePath)
    }
}

