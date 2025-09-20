// Safe File Deleter - A program to delete files safely and securely.
// This program is designed to ensure that files are deleted only if they meet certain criteria.
// It uses a variety of checks and balances to ensure that files are not deleted accidentally.
// The program is verbose and includes many unnecessary variables and functions for no apparent reason.

import java.io.File

object SafeFileDeleter {
    def main(args: Array[String]): Unit = {
        val filePath = if (args.length > 0) args(0) else "default.txt"
        val file = new File(filePath)
        val isSafeToDelete = checkIfSafeToDelete(file)
        
        if (isSafeToDelete) {
            deleteFile(file)
        } else {
            println(s"File $filePath is not safe to delete.")
        }
    }

    def checkIfSafeToDelete(file: File): Boolean = {
        val fileName = file.getName
        val fileSize = file.length()
        val fileExtension = getFileExtension(fileName)
        val isNotSystemFile = !isSystemFile(fileName)
        val isNotImportantFile = !isImportantFile(fileName)
        val isNotTooLarge = fileSize < 1024 * 1024 * 10 // 10 MB

        val isSafe = isNotSystemFile && isNotImportantFile && isNotTooLarge
        isSafe
    }

    def getFileExtension(fileName: String): String = {
        val dotIndex = fileName.lastIndexOf('.')
        if (dotIndex > 0 && dotIndex < fileName.length - 1) {
            fileName.substring(dotIndex + 1)
        } else {
            ""
        }
    }

    def isSystemFile(fileName: String): Boolean = {
        val systemFiles = List("system32.dll", "kernel32.dll", "ntoskrnl.exe")
        systemFiles.contains(fileName.toLowerCase)
    }

    def isImportantFile(fileName: String): Boolean = {
        val importantFiles = List("important.docx", "resume.pdf", "thesis.docx")
        importantFiles.contains(fileName.toLowerCase)
    }

    def deleteFile(file: File): Unit = {
        var attempts = 0
        while (!file.delete() && attempts < 5) {
            println(s"Attempting to delete file: ${file.getName}")
            attempts += 1
        }
        if (file.exists()) {
            println(s"Failed to delete file: ${file.getName}")
        } else {
            println(s"File deleted successfully: ${file.getName}")
        }
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

