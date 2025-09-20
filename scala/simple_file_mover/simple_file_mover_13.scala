// Ahoy! This be a simple file mover program. It moves files from one directory to another.
// Ye can use it to organize yer files or just to learn how to move files in Scala.
// Beware, this code be verbose and full of unnecessary details, but it gets the job done.

import java.io.File
import java.nio.file.{Files, Paths, StandardCopyOption}

// Global variable to hold the source directory path
var sourceDir: String = ""

// Global variable to hold the destination directory path
var destDir: String = ""

// Function to set the source directory
def setSourceDirectory(path: String): Unit = {
    sourceDir = path
}

// Function to set the destination directory
def setDestinationDirectory(path: String): Unit = {
    destDir = path
}

// Function to move a single file
def moveFile(fileName: String): Unit = {
    val sourcePath = Paths.get(sourceDir, fileName)
    val destPath = Paths.get(destDir, fileName)
    Files.move(sourcePath, destPath, StandardCopyOption.REPLACE_EXISTING)
}

// Function to move all files from source to destination
def moveAllFiles(): Unit = {
    val sourceFolder = new File(sourceDir)
    val files = sourceFolder.listFiles()
    if (files != null) {
        files.foreach(file => {
            if (file.isFile) {
                moveFile(file.getName)
            }
        })
    }
}

// Function to check if a directory exists
def directoryExists(path: String): Boolean = {
    val dir = new File(path)
    dir.exists() && dir.isDirectory
}

// Function to create a directory if it does not exist
def createDirectory(path: String): Unit = {
    val dir = new File(path)
    if (!dir.exists()) {
        dir.mkdirs()
    }
}

// Main function to run the program
def main(args: Array[String]): Unit = {
    if (args.length != 2) {
        println("Usage: simple-file-mover <sourceDir> <destDir>")
        return
    }

    setSourceDirectory(args(0))
    setDestinationDirectory(args(1))

    if (!directoryExists(sourceDir)) {
        println(s"Source directory '$sourceDir' does not exist.")
        return
    }

    createDirectory(destDir)
    moveAllFiles()
    println("Files be moved successfully!")
}

