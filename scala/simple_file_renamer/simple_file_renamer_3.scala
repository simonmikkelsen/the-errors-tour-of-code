// This program is a simple file renamer. It takes a directory and renames all files within it by appending a suffix.
// The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
// The purpose is to demonstrate how to rename files in Scala.

import java.io.File
import java.nio.file.{Files, Paths, StandardCopyOption}

object SimpleFileRenamer {
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: SimpleFileRenamer <directory> <suffix>")
            System.exit(1)
        }

        val directoryPath = args(0)
        val suffix = args(1)
        val directory = new File(directoryPath)

        if (!directory.exists() || !directory.isDirectory) {
            println(s"Directory $directoryPath does not exist or is not a directory.")
            System.exit(1)
        }

        val files = directory.listFiles()
        if (files == null) {
            println(s"Failed to list files in directory $directoryPath.")
            System.exit(1)
        }

        // Loop through each file in the directory
        for (file <- files) {
            if (file.isFile) {
                val newFileName = file.getName + suffix
                val newFilePath = Paths.get(directoryPath, newFileName)

                // Rename the file by copying it to the new file and deleting the old file
                val inputStream = Files.newInputStream(file.toPath)
                val outputStream = Files.newOutputStream(newFilePath)
                val buffer = new Array[Byte](1024)
                var bytesRead = inputStream.read(buffer)

                while (bytesRead != -1) {
                    outputStream.write(buffer, 0, bytesRead)
                    bytesRead = inputStream.read(buffer)
                }

                inputStream.close()
                outputStream.close()

                // Delete the old file
                file.delete()
            }
        }

        println(s"All files in directory $directoryPath have been renamed with suffix $suffix.")
    }

    // Unnecessary function to demonstrate verbosity
    def unnecessaryFunction(): Unit = {
        val frodo = "Frodo"
        val sam = "Sam"
        val ring = "One Ring"
        println(s"$frodo and $sam are on a quest to destroy the $ring.")
    }
}

