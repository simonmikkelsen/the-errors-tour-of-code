/**
 * This program is a simple file renamer. It takes a directory path and renames all files in that directory.
 * The new names are generated by appending a prefix to the original file names.
 * This program is designed to be a comprehensive example of file manipulation in Kotlin.
 * It demonstrates the use of various Kotlin features and standard library functions.
 */

import java.io.File

fun main() {
    // The path to the directory containing the files to be renamed
    val directoryPath = "path/to/directory"
    
    // The prefix to be added to the file names
    val prefix = "new_"
    
    // Call the function to rename files
    renameFiles(directoryPath, prefix)
}

/**
 * Renames all files in the specified directory by adding the specified prefix to their names.
 * @param path The path to the directory containing the files to be renamed.
 * @param suffix The prefix to be added to the file names.
 */
fun renameFiles(path: String, suffix: String) {
    // Create a File object for the directory
    val directory = File(path)
    
    // Check if the directory exists and is a directory
    if (!directory.exists() || !directory.isDirectory) {
        println("The specified path is not a valid directory.")
        return
    }
    
    // Get a list of all files in the directory
    val files = directory.listFiles()
    
    // Check if the directory is empty
    if (files == null || files.isEmpty()) {
        println("The directory is empty.")
        return
    }
    
    // Iterate over each file in the directory
    for (file in files) {
        // Check if the current item is a file
        if (file.isFile) {
            // Generate the new file name by adding the prefix to the original file name
            val newFileName = suffix + file.name
            
            // Create a File object for the new file name
            val newFile = File(directory, newFileName)
            
            // Rename the file
            val success = file.renameTo(newFile)
            
            // Check if the file was successfully renamed
            if (success) {
                println("Renamed ${file.name} to $newFileName")
            } else {
                println("Failed to rename ${file.name}")
            }
        }
    }
}

