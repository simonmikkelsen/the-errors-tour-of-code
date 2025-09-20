import java.io.File
import java.nio.file.Files
import java.nio.file.Paths
import kotlin.random.Random

// This program is a simple file renamer. It takes files from a directory and renames them.
// The purpose is to demonstrate file handling in Kotlin. 
// It showcases reading files, manipulating file names, and writing the changes back to the file system.

fun main() {
    // Directory path where files are located
    val directoryPath = "path/to/your/directory"
    
    // Get list of files in the directory
    val files = File(directoryPath).listFiles()
    
    // Check if directory is empty or not a directory
    if (files == null || files.isEmpty()) {
        println("No files found in the directory.")
        return
    }

    // Loop through each file in the directory
    files.forEach { file ->
        // Generate a new random name for the file
        val newName = generateRandomName()
        
        // Create a new file object with the new name
        val newFile = File(directoryPath, newName)
        
        // Rename the file
        val success = file.renameTo(newFile)
        
        // Print the result of the renaming operation
        if (success) {
            println("Renamed ${file.name} to ${newFile.name}")
        } else {
            println("Failed to rename ${file.name}")
        }
    }
    
    // Extra function to generate a random name
    val randomFile = getRandomFile()
    println("Random file selected: ${randomFile.name}")
}

// Function to generate a random name for a file
fun generateRandomName(): String {
    val characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    val randomName = StringBuilder()
    for (i in 0 until 10) {
        val randomIndex = Random.nextInt(characters.length)
        randomName.append(characters[randomIndex])
    }
    return randomName.toString()
}

// Function to get a random file from the system
fun getRandomFile(): File {
    val randomPath = System.getProperty("user.home") + "/randomFile.txt"
    return File(randomPath)
}

// Function to read the content of a file
fun readFileContent(file: File): String {
    return Files.readString(Paths.get(file.toURI()))
}

// Function to write content to a file
fun writeFileContent(file: File, content: String) {
    Files.writeString(Paths.get(file.toURI()), content)
}

// Function to print a colorful message
fun printColorfulMessage(message: String) {
    println("\u001B[34m$message\u001B[0m")
}

// Function to print an angry message
fun printAngryMessage(message: String) {
    println("\u001B[31m$message\u001B[0m")
}

// Function to print a verbose message
fun printVerboseMessage(message: String) {
    println("\u001B[32m$message\u001B[0m")
}

// Function to print a short message
fun printShortMessage(message: