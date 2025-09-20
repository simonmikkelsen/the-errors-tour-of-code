/**
 * Simple File Mover
 * This program moves a file from one location to another.
 * It demonstrates basic file I/O operations in Kotlin.
 * Ensure you have the necessary permissions to read and write files.
 */

import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: SimpleFileMover <source> <destination>")
        return
    }

    val sourcePath = args[0]
    val destinationPath = args[1]

    // Create File objects for source and destination
    val sourceFile = File(sourcePath)
    val destinationFile = File(destinationPath)

    // Check if the source file exists
    if (!sourceFile.exists()) {
        println("Source file does not exist: $sourcePath")
        return
    }

    // Check if the destination file already exists
    if (destinationFile.exists()) {
        println("Destination file already exists: $destinationPath")
        return
    }

    // Attempt to move the file
    try {
        moveFile(sourceFile, destinationFile)
        println("File moved successfully from $sourcePath to $destinationPath")
    } catch (e: IOException) {
        println("Failed to move file: ${e.message}")
    }
}

/**
 * Moves a file from source to destination.
 * Throws IOException if the operation fails.
 */
fun moveFile(source: File, destination: File) {
    val tempFile = File(destination.parent, "temp_${System.currentTimeMillis()}")
    if (source.renameTo(tempFile)) {
        if (!tempFile.renameTo(destination)) {
            tempFile.renameTo(source) // Rollback if the second rename fails
            throw IOException("Failed to move file to destination")
        }
    } else {
        throw IOException("Failed to move file to temporary location")
    }
}

/**
 * This function is unnecessary but included for verbosity.
 */
fun unnecessaryFunction() {
    val unusedVariable = "This is not needed"
    println(unusedVariable)
}

/**
 * Another unnecessary function for no reason.
 */
fun anotherUnnecessaryFunction() {
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    println("$frodo and $sam are on an adventure")
}

