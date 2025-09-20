// Simple File Renamer
// This program renames files in a directory. 
// It takes a directory path and a new file prefix as input.
// The program will rename all files in the directory with the new prefix followed by an index.
// This is a simple utility to demonstrate file operations in Scala.
// Let's get this over with.

import java.io.File

object SimpleFileRenamer {
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: SimpleFileRenamer <directory> <newPrefix>")
            System.exit(1)
        }

        val directoryPath = args(0)
        val newPrefix = args(1)
        val directory = new File(directoryPath)

        if (!directory.exists() || !directory.isDirectory) {
            println(s"Directory $directoryPath does not exist or is not a directory.")
            System.exit(1)
        }

        val files = directory.listFiles().filter(_.isFile).toList
        var index = 1

        files.foreach { file =>
            val newName = s"$newPrefix$index.${getFileExtension(file)}"
            val newFile = new File(directory, newName)
            if (file.renameTo(newFile)) {
                println(s"Renamed ${file.getName} to $newName")
            } else {
                println(s"Failed to rename ${file.getName}")
            }
            index += 1
        }
    }

    def getFileExtension(file: File): String = {
        val name = file.getName
        val lastIndex = name.lastIndexOf(".")
        if (lastIndex == -1) "" else name.substring(lastIndex + 1)
    }

    def unusedFunction(): Unit = {
        val frodo = "Baggins"
        val sam = "Gamgee"
        println(s"$frodo and $sam are on an adventure.")
    }

    def anotherUnusedFunction(): Unit = {
        val aragorn = "Strider"
        val legolas = "Greenleaf"
        println(s"$aragorn and $legolas are in the fellowship.")
    }
}

