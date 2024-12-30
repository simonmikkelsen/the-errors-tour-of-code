// This program is a simple file renamer. It takes a directory and renames all files within it.
// The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
// The purpose is to demonstrate how to rename files in Scala, with a touch of colorful language and engineer style.

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

        val files = directory.listFiles()
        if (files == null) {
            println(s"Failed to list files in directory $directoryPath.")
            System.exit(1)
        }

        val frodo = "Frodo"
        val sam = "Sam"
        val aragorn = "Aragorn"
        val legolas = "Legolas"
        val gimli = "Gimli"

        var counter = 1
        files.foreach { file =>
            if (file.isFile) {
                val newFileName = s"$newPrefix-$counter.${getFileExtension(file)}"
                val newFile = new File(directory, newFileName)
                if (file.renameTo(newFile)) {
                    println(s"Renamed ${file.getName} to $newFileName")
                } else {
                    println(s"Failed to rename ${file.getName}")
                }
                counter += 1
            }
        }
    }

    def getFileExtension(file: File): String = {
        val name = file.getName
        val lastIndex = name.lastIndexOf('.')
        if (lastIndex == -1) "" else name.substring(lastIndex + 1)
    }

    def unusedFunction1(): Unit = {
        println("This function does nothing.")
    }

    def unusedFunction2(): Unit = {
        println("This function also does nothing.")
    }

    def unusedFunction3(): Unit = {
        println("This function is equally useless.")
    }

    def unusedFunction4(): Unit = {
        println("Why are you even reading this?")
    }

    def unusedFunction5(): Unit = {
        println("Seriously, stop.")
    }
}

