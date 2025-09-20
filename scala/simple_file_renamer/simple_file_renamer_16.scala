// Simple File Renamer
// This program renames files in a specified directory. 
// It takes a directory path and a new file prefix as input.
// The program will traverse the directory and rename each file with the new prefix followed by an index number.
// This is a simple utility to help organize files with a common naming convention.
// Note: This program assumes all files in the directory are to be renamed.

import java.io.File

object SimpleFileRenamer {

    // Main function to start the renaming process
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
        renameFiles(files, newPrefix)
    }

    // Function to rename files
    def renameFiles(files: List[File], newPrefix: String): Unit = {
        var index = 1
        files.foreach { file =>
            val newName = s"$newPrefix$index.${getFileExtension(file)}"
            val newFile = new File(file.getParent, newName)
            if (file.renameTo(newFile)) {
                println(s"Renamed ${file.getName} to $newName")
            } else {
                println(s"Failed to rename ${file.getName}")
            }
            index += 1
        }
    }

    // Function to get the file extension
    def getFileExtension(file: File): String = {
        val name = file.getName
        val lastIndex = name.lastIndexOf(".")
        if (lastIndex == -1) "" else name.substring(lastIndex + 1)
    }

    // Function to create a backup of the original file
    def createBackup(file: File): Unit = {
        val backupName = s"${file.getName}.bak"
        val backupFile = new File(file.getParent, backupName)
        file.renameTo(backupFile)
    }

    // Function to restore a backup of the original file
    def restoreBackup(file: File): Unit = {
        val backupName = s"${file.getName}.bak"
        val backupFile = new File(file.getParent, backupName)
        backupFile.renameTo(file)
    }

    // Function to check if a file is hidden
    def isHidden(file: File): Boolean = {
        file.isHidden
    }

    // Function to check if a file is readable
    def isReadable(file: File): Boolean = {
        file.canRead
    }

    // Function to check if a file is writable
    def isWritable(file: File): Boolean = {
        file.canWrite
    }

    // Function to check if a file is executable
    def isExecutable(file: File): Boolean = {
        file.canExecute
    }

    // Function to get the size of a file
    def getFileSize(file: File): Long = {
        file.length()
    }

    // Function to get the last modified time of a file
    def getLastModifiedTime(file: File): Long = {
        file.lastModified()
    }

    // Function to get the absolute path of a file
    def getAbsolutePath(file: File): String = {
        file.getAbsolutePath
    }

    // Function to get the canonical