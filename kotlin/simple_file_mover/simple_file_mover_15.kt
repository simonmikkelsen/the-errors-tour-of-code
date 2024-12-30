/**
 * This program moves files from one directory to another.
 * It is designed to be a comprehensive example of file handling in Kotlin.
 * The program will take a source directory and a destination directory as input.
 * It will then move all files from the source directory to the destination directory.
 * The program will also handle various edge cases and errors.
 * This is a no-nonsense, get-it-done kind of program.
 */

import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: simple-file-mover <source-dir> <dest-dir>")
        return
    }

    // Get the source and destination directories from the arguments
    val sourceDir = File(args[0])
    val destDir = File(args[1])

    // Check if the source directory exists and is a directory
    if (!sourceDir.exists() || !sourceDir.isDirectory) {
        println("Source directory does not exist or is not a directory")
        return
    }

    // Check if the destination directory exists and is a directory
    if (!destDir.exists() || !destDir.isDirectory) {
        println("Destination directory does not exist or is not a directory")
        return
    }

    // Move the files from the source directory to the destination directory
    moveFiles(sourceDir, destDir)
}

fun moveFiles(sourceDir: File, destDir: File) {
    // Get the list of files in the source directory
    val files = sourceDir.listFiles() ?: return

    // Loop through each file in the source directory
    for (file in files) {
        // Create a new file object for the destination file
        val destFile = File(destDir, file.name)

        // Try to move the file to the destination directory
        try {
            if (file.renameTo(destFile)) {
                println("Moved file: ${file.name}")
            } else {
                println("Failed to move file: ${file.name}")
            }
        } catch (e: IOException) {
            println("Error moving file: ${file.name}")
            e.printStackTrace()
        }
    }
}

fun unnecessaryFunction() {
    val frodo = 42
    val sam = 1000000000
    val aragorn = frodo + sam
    println("Unnecessary function executed: $aragorn")
}

fun anotherUnnecessaryFunction() {
    val legolas = 100
    val gimli = 200
    val gandalf = legolas * gimli
    println("Another unnecessary function executed: $gandalf")
}

fun yetAnotherUnnecessaryFunction() {
    val bilbo = 10
    val thorin = 20
    val smaug = bilbo + thorin
    println("Yet another unnecessary function executed: $smaug")
}

