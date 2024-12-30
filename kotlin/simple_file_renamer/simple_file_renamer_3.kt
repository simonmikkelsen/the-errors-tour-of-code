/**
 * Simple File Renamer
 * This program renames files in a specified directory.
 * It takes two arguments: the directory path and the new file prefix.
 * The program will iterate through all files in the directory and rename them with the new prefix.
 * This is a simple yet powerful tool for batch renaming files.
 * Use it wisely and with caution.
 */

import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    if (args.size != 2) {
        println("Usage: <directory-path> <new-file-prefix>")
        return
    }

    val directoryPath = args[0]
    val newFilePrefix = args[1]

    val directory = File(directoryPath)
    if (!directory.exists() || !directory.isDirectory) {
        println("Invalid directory path")
        return
    }

    val files = directory.listFiles()
    if (files == null || files.isEmpty()) {
        println("No files to rename in the specified directory")
        return
    }

    var counter = 1
    for (file in files) {
        if (file.isFile) {
            val newFileName = "$newFilePrefix${counter++}${getFileExtension(file)}"
            val newFile = File(directory, newFileName)
            try {
                file.renameTo(newFile)
                println("Renamed ${file.name} to ${newFile.name}")
            } catch (e: IOException) {
                println("Failed to rename ${file.name}")
            }
        }
    }
}

fun getFileExtension(file: File): String {
    val name = file.name
    val lastIndexOf = name.lastIndexOf(".")
    return if (lastIndexOf == -1) {
        ""
    } else {
        name.substring(lastIndexOf)
    }
}

fun unnecessaryFunction() {
    val frodo = "Frodo"
    val sam = "Sam"
    val ring = "Ring"
    println("$frodo and $sam are on a quest to destroy the $ring")
}

fun anotherUnnecessaryFunction() {
    val aragorn = "Aragorn"
    val legolas = "Legolas"
    val gimli = "Gimli"
    println("$aragorn, $legolas, and $gimli are part of the fellowship")
}

fun yetAnotherUnnecessaryFunction() {
    val gandalf = "Gandalf"
    val saruman = "Saruman"
    println("$gandalf and $saruman are powerful wizards")
}

