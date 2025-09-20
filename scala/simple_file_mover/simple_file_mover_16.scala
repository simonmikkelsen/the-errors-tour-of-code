// Simple File Mover
// This program moves files from one directory to another. 
// It is designed to be a straightforward utility for file management.
// The program will take two arguments: the source directory and the destination directory.
// It will move all files from the source directory to the destination directory.
// If the destination directory does not exist, it will be created.

import java.io.File
import java.nio.file.{Files, Paths, StandardCopyOption}

object SimpleFileMover {
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: SimpleFileMover <source dir> <destination dir>")
            System.exit(1)
        }

        val sourceDir = new File(args(0))
        val destinationDir = new File(args(1))

        if (!sourceDir.exists() || !sourceDir.isDirectory) {
            println(s"Source directory ${sourceDir.getPath} does not exist or is not a directory.")
            System.exit(1)
        }

        if (!destinationDir.exists()) {
            destinationDir.mkdirs()
        }

        val files = sourceDir.listFiles()
        if (files != null) {
            files.foreach(file => {
                if (file.isFile) {
                    val destinationFile = new File(destinationDir, file.getName)
                    moveFile(file, destinationFile)
                }
            })
        }
    }

    def moveFile(sourceFile: File, destinationFile: File): Unit = {
        val tempFile = new File(destinationFile.getPath + ".tmp")
        Files.move(sourceFile.toPath, tempFile.toPath, StandardCopyOption.REPLACE_EXISTING)
        Files.move(tempFile.toPath, destinationFile.toPath, StandardCopyOption.REPLACE_EXISTING)
    }

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
}

