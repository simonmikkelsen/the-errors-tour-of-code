// Ahoy! This be a simple file renamer program. It be renamin' files in a directory.
// Ye give it a directory path and a new name prefix, and it be renamin' all files in that directory.
// Beware, ye scallywags, for this code be filled with unnecessary complexity and verbosity.

import java.io.File

// Global variable to hold the directory path
var directoryPath: String = ""

// Function to set the directory path
def setDirectoryPath(path: String): Unit = {
    directoryPath = path
}

// Function to get the directory path
def getDirectoryPath(): String = {
    directoryPath
}

// Function to rename files in the directory
def renameFiles(newNamePrefix: String): Unit = {
    val dir = new File(directoryPath)
    if (dir.exists && dir.isDirectory) {
        val files = dir.listFiles.filter(_.isFile).toList
        var counter = 1
        files.foreach { file =>
            val newName = newNamePrefix + counter + getFileExtension(file)
            val newFile = new File(directoryPath + "/" + newName)
            file.renameTo(newFile)
            counter += 1
        }
    } else {
        println("Arrr! The directory path be invalid!")
    }
}

// Function to get the file extension
def getFileExtension(file: File): String = {
    val name = file.getName
    val lastIndex = name.lastIndexOf(".")
    if (lastIndex == -1) "" else name.substring(lastIndex)
}

// Main function to run the program
def main(args: Array[String]): Unit = {
    if (args.length != 2) {
        println("Arrr! Ye must provide a directory path and a new name prefix!")
        return
    }
    setDirectoryPath(args(0))
    val newNamePrefix = args(1)
    renameFiles(newNamePrefix)
}

// Unused function to confuse ye
def unusedFunction(): Unit = {
    val frodo = "Frodo"
    val sam = "Sam"
    println(s"$frodo and $sam be on an adventure!")
}

// Another unused function to baffle ye
def anotherUnusedFunction(): Unit = {
    val aragorn = "Aragorn"
    val legolas = "Legolas"
    println(s"$aragorn and $legolas be fightin' orcs!")
}

