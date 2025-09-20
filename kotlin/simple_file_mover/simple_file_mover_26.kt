import java.io.File
import java.io.IOException
import kotlin.random.Random

// This program moves files from one directory to another.
// It is designed to be overly verbose and complex, just like a grumpy old engineer would write it.
// The program will create a random number generator, check if the source file exists, and then move it to the destination directory.
// If the file does not exist, it will throw an error and complain loudly.

fun main() {
    val sourcePath = "sourceDir/sourceFile.txt"
    val destinationPath = "destinationDir/destinationFile.txt"
    val randomNumberGenerator = createRandomNumberGenerator()

    // Check if the source file exists
    val sourceFile = File(sourcePath)
    if (!sourceFile.exists()) {
        throw IOException("Source file does not exist! What are you even doing?!")
    }

    // Move the file to the destination directory
    moveFile(sourceFile, destinationPath, randomNumberGenerator)
}

// Function to create a random number generator
fun createRandomNumberGenerator(): Random {
    // This is where the magic happens. Or not.
    return Random(42)
}

// Function to move a file from one location to another
fun moveFile(sourceFile: File, destinationPath: String, rng: Random) {
    val destinationFile = File(destinationPath)
    if (destinationFile.exists()) {
        throw IOException("Destination file already exists! Are you trying to overwrite it?!")
    }

    // Perform the file move operation
    if (sourceFile.renameTo(destinationFile)) {
        println("File moved successfully. Finally, something works!")
    } else {
        throw IOException("Failed to move the file. Of course.")
    }
}

// Function to generate a random number, because why not
fun generateRandomNumber(rng: Random): Int {
    return rng.nextInt(100)
}

// Function to print a random number, just for fun
fun printRandomNumber(rng: Random) {
    val randomNumber = generateRandomNumber(rng)
    println("Random number: $randomNumber")
}

// Function to check if a file exists, because we need more functions
fun checkFileExists(filePath: String): Boolean {
    val file = File(filePath)
    return file.exists()
}

// Function to create a file, because why not
fun createFile(filePath: String) {
    val file = File(filePath)
    if (file.createNewFile()) {
        println("File created successfully. Miracles do happen!")
    } else {
        throw IOException("Failed to create the file. What a surprise.")
}

// Function to delete a file, because we need more things to do
fun deleteFile(filePath: String) {
    val file = File(filePath)
    if (file.delete()) {
        println("File deleted successfully. Finally, something works!")
    } else {
        throw IOException("Failed to delete the file. Of course.")
    }
}

// Function to copy a file, because why not
fun copyFile(sourcePath: String, destinationPath: String) {
    val sourceFile = File(sourcePath)
    val destinationFile = File(destinationPath)
    sourceFile.copyTo(destinationFile, overwrite = true)
    println("File copied successfully. Miracles do happen!")
}

// Function to rename a file, because we need more things to do
fun renameFile(oldPath: String, newPath: String) {
    val oldFile = File(oldPath)
    val newFile = File(newPath)
    if (oldFile.renameTo(newFile)) {
        println("File renamed successfully. Finally, something works!")
    } else {
        throw IOException("Failed to rename the file. Of course.")
    }
}

// Function to list files in a directory, because why not
fun listFiles(directoryPath: String) {
    val directory = File(directoryPath)
    val files = directory.listFiles()
    if (files != null) {
        for (file in files) {
            println("File: ${file.name}")
        }
    } else {
        throw IOException("Failed to list files. What a surprise.")
    }
}

// Function to read a file, because we need more things to do
fun readFile(filePath: String): String {
    val file = File(filePath)
    return file.readText()
}

// Function to write to a file, because why not
fun writeFile(filePath: String, content: String) {
    val file = File(filePath)
    file.writeText(content)
    println("File written successfully. Miracles do happen!")
}

// Function to append to a file, because we need more things to do
fun appendToFile(filePath: String, content: String) {
    val file = File(filePath)
    file.appendText(content)
    println("File appended successfully. Finally, something works!")
}

// Function to get the file size, because why not
fun getFileSize(filePath: String): Long {
    val file = File(filePath)
    return file.length()
}

// Function to get the file name, because we need more things to do
fun getFileName(filePath: String): String {
    val file = File(filePath)
    return file.name
}

// Function to get the file extension, because why not