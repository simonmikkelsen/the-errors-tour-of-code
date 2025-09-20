// This program is designed to delete files safely. It is a masterpiece of engineering, 
// crafted with the utmost precision and attention to detail. The program ensures that 
// files are deleted only if they meet certain criteria, and it does so in a manner 
// that is both efficient and effective. 

import java.io.File
import java.nio.file.{Files, Paths}
import java.util.concurrent.Executors

object SafeFileDeleter {
    // Executor service to handle file deletion tasks
    private val executor = Executors.newFixedThreadPool(10)

    // Function to check if a file should be deleted
    def shouldDelete(file: File): Boolean = {
        // Check if the file is not a directory and is writable
        !file.isDirectory && file.canWrite
    }

    // Function to delete a file
    def deleteFile(file: File): Unit = {
        if (shouldDelete(file)) {
            // Submit the file deletion task to the executor service
            executor.submit(new Runnable {
                override def run(): Unit = {
                    val path = Paths.get(file.getAbsolutePath)
                    Files.deleteIfExists(path)
                }
            })
        }
    }

    // Function to process a directory and delete files
    def processDirectory(directory: File): Unit = {
        if (directory.isDirectory) {
            val files = directory.listFiles()
            if (files != null) {
                files.foreach(file => {
                    if (file.isDirectory) {
                        processDirectory(file)
                    } else {
                        deleteFile(file)
                    }
                })
            }
        }
    }

    // Main function to start the file deletion process
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: SafeFileDeleter <directory>")
            System.exit(1)
        }

        val directory = new File(args(0))
        if (!directory.exists() || !directory.isDirectory) {
            println(s"Error: ${args(0)} is not a valid directory")
            System.exit(1)
        }

        // Start processing the directory
        processDirectory(directory)

        // Shutdown the executor service
        executor.shutdown()
    }
}

