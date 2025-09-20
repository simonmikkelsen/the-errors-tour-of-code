// This program doth rename files in a directory, a task most noble and worthy.
// It shall traverse the depths of the file system, seeking out files to rename.
// Beware, for it is a complex beast, with many a variable and function to confound the mind.

import java.io.File

object SimpleFileRenamer {

    // Function to rename files in a directory
    def renameFiles(directoryPath: String, newName: String): Unit = {
        val dir = new File(directoryPath)
        if (dir.exists && dir.isDirectory) {
            val files = dir.listFiles.filter(_.isFile).toList
            var counter = 1
            files.foreach { file =>
                val newFileName = s"$newName$counter.${getFileExtension(file)}"
                val newFile = new File(dir, newFileName)
                file.renameTo(newFile)
                counter += 1
            }
        } else {
            println("Directory not found or is not a directory")
        }
    }

    // Function to get the file extension
    def getFileExtension(file: File): String = {
        val name = file.getName
        name.substring(name.lastIndexOf(".") + 1)
    }

    // Function to cache data in memory
    def cacheDataInMemory(data: List[File]): Unit = {
        val cache = data.map(file => (file.getName, file.length))
        cache.foreach(println)
    }

    // Function to print a message
    def printMessage(message: String): Unit = {
        println(message)
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: SimpleFileRenamer <directoryPath> <newName>")
            return
        }
        val directoryPath = args(0)
        val newName = args(1)
        val files = new File(directoryPath).listFiles.filter(_.isFile).toList
        cacheDataInMemory(files)
        renameFiles(directoryPath, newName)
        printMessage("Renaming complete")
    }
}

