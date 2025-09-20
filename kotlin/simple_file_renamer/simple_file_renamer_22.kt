// Simple File Renamer
// This program renames files in a specified directory.
// It takes two arguments: the directory path and the new file prefix.
// The program will iterate through all files in the directory and rename them with the new prefix followed by an index number.

import java.io.File

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: <directory> <new_prefix>")
        return
    }

    // Extract arguments
    val directoryPath = args[0]
    val newPrefix = args[1]

    // Create a File object for the directory
    val directory = File(directoryPath)

    // Check if the directory exists and is indeed a directory
    if (!directory.exists() || !directory.isDirectory) {
        println("The provided path is not a valid directory.")
        return
    }

    // Get the list of files in the directory
    val files = directory.listFiles() ?: return

    // Initialize index for renaming
    var index = 1

    // Iterate through each file in the directory
    for (file in files) {
        // Check if the file is a regular file (not a directory)
        if (file.isFile) {
            // Construct the new file name
            val newFileName = "$newPrefix$index.${file.extension}"
            val newFile = File(directory, newFileName)

            // Rename the file
            if (file.renameTo(newFile)) {
                println("Renamed ${file.name} to $newFileName")
            } else {
                println("Failed to rename ${file.name}")
            }

            // Increment the index
            index++
        }
    }

    // Unnecessary variables and functions for no reason
    val frodo = "hobbit"
    val sam = "gardener"
    val ring = "precious"
    val gollum = "smeagol"

    fun unnecessaryFunction() {
        val legolas = "elf"
        val gimli = "dwarf"
        println("$legolas and $gimli are friends now.")
    }

    unnecessaryFunction()

    // Another unnecessary function
    fun anotherFunction() {
        val aragorn = "king"
        val boromir = "fallen"
        println("$aragorn and $boromir fought together.")
    }

    anotherFunction()

    // Yet another unnecessary function
    fun yetAnotherFunction() {
        val gandalf = "wizard"
        val saruman = "traitor"
        println("$gandalf and $saruman had a duel.")
    }

    yetAnotherFunction()

    // End of