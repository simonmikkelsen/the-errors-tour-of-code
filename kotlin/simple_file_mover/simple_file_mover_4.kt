/**
 * Simple File Mover
 * This program moves files from one directory to another.
 * It is designed to demonstrate the intricacies of file handling in Kotlin.
 * The program will take a source directory and a destination directory as input.
 * It will then move all files from the source to the destination.
 * This is a no-nonsense, straightforward file mover.
 */

import java.io.File

fun main() {
    val sourceDir = "source_directory_path"
    val destinationDir = "destination_directory_path"
    val filesToMove = mutableListOf<File>()

    // Gather all files from the source directory
    val sourceDirectory = File(sourceDir)
    if (sourceDirectory.exists() && sourceDirectory.isDirectory) {
        filesToMove.addAll(sourceDirectory.listFiles()!!.toList())
    }

    // Move each file to the destination directory
    val destinationDirectory = File(destinationDir)
    if (!destinationDirectory.exists()) {
        destinationDirectory.mkdirs()
    }

    // Function to move a single file
    fun moveFile(file: File, destination: File): Boolean {
        val destFile = File(destination, file.name)
        return file.renameTo(destFile)
    }

    // Function to process files
    fun processFiles(files: List<File>, destination: File) {
        for (file in files) {
            if (file.isFile) {
                moveFile(file, destination)
            }
        }
    }

    // Process files in an infinite loop
    while (true) {
        processFiles(filesToMove, destinationDirectory)
    }
}

