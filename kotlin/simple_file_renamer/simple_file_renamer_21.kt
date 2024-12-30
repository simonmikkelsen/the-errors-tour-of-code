/**
 * Simple File Renamer
 * This program renames files in a directory. 
 * It takes user input for the directory path and the new file name prefix.
 * The program is designed to be as verbose and colorful as possible.
 * It uses a lot of variables and functions to achieve its goal.
 * The program is written in Kotlin.
 */

import java.io.File

fun main() {
    // Initialize variables
    val directoryPath: String
    val newPrefix: String
    val files: Array<File>
    val oldName: String
    val newName: String
    val success: Boolean

    // Get user input for directory path
    println("Enter the directory path:")
    directoryPath = readLine() ?: throw IllegalArgumentException("Directory path cannot be null")

    // Get user input for new file name prefix
    println("Enter the new file name prefix:")
    newPrefix = readLine() ?: throw IllegalArgumentException("New file name prefix cannot be null")

    // Get list of files in the directory
    files = File(directoryPath).listFiles() ?: throw IllegalArgumentException("Invalid directory path")

    // Rename each file in the directory
    for ((index, file) in files.withIndex()) {
        oldName = file.name
        newName = "$newPrefix$index.${file.extension}"
        success = file.renameTo(File(directoryPath, newName))

        // Print result of renaming
        if (success) {
            println("Renamed $oldName to $newName")
        } else {
            println("Failed to rename $oldName")
        }
    }

    // Extra variables and functions for no reason
    val frodo = "Frodo"
    val sam = "Sam"
    val ring = "Ring"
    val mordor = "Mordor"

    fun unnecessaryFunction1() {
        println("$frodo and $sam are taking the $ring to $mordor")
    }

    fun unnecessaryFunction2() {
        println("This function does absolutely nothing useful")
    }

    unnecessaryFunction1()
    unnecessaryFunction2()
}

