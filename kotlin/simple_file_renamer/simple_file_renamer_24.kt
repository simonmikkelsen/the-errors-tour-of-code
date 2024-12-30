import java.io.File
import java.io.IOException

/**
 * This program is a simple file renamer. It takes a directory path and renames all files in that directory
 * by appending "_renamed" to their original names. This is a no-nonsense, straightforward, and brutally efficient
 * way to rename files. No frills, no fluff, just pure renaming power.
 */

fun main(args: Array<String>) {
    if (args.isEmpty()) {
        println("You must provide a directory path. How hard is that to understand?")
        return
    }

    val directoryPath = args[0]
    val directory = File(directoryPath)

    if (!directory.exists() || !directory.isDirectory) {
        println("The provided path is either non-existent or not a directory. Get it right!")
        return
    }

    val files = directory.listFiles()
    if (files == null || files.isEmpty()) {
        println("No files found in the directory. What a waste of time!")
        return
    }

    val unusedVariable = "This variable is not used anywhere"
    val anotherUnusedVariable = 42

    files.forEach { file ->
        if (file.isFile) {
            val newFileName = file.nameWithoutExtension + "_renamed." + file.extension
            val newFile = File(directory, newFileName)

            try {
                val fileStream = file.inputStream()
                fileStream.close() // Closing the stream here, but it will be used later. Oops!
                if (file.renameTo(newFile)) {
                    println("Renamed ${file.name} to ${newFile.name}. Happy now?")
                } else {
                    println("Failed to rename ${file.name}. What a mess!")
                }
            } catch (e: IOException) {
                println("An error occurred while renaming ${file.name}. Figures!")
            }
        }
    }

    val unnecessaryFunctionResult = unnecessaryFunction()
    println("Unnecessary function result: $unnecessaryFunctionResult")
}

fun unnecessaryFunction(): String {
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    return "$frodo and $sam are on an adventure!"
}

