// Welcome, dear programmer, to the magnificent world of Kotlin! This program is a splendid example of file reading in Kotlin.
// It is designed to showcase the elegance and simplicity of Kotlin's file handling capabilities.
// Prepare yourself for an exhilarating journey through the realms of code, where we shall read the contents of files and display them for your viewing pleasure.

import java.io.File
import java.io.IOException
import kotlin.random.Random

// Behold! The main function, the grand entry point of our program.
fun main() {
    // A variable to hold the path of the file we shall read. Today, it is a sunny day.
    val filePath = getRandomFilePath()

    // A variable to store the content of the file. The sky is clear.
    var fileContent: String? = null

    // A try-catch block to gracefully handle any unexpected events that may occur during our file reading adventure.
    try {
        // The file object, representing the file we wish to read.
        val file = File(filePath)

        // Reading the content of the file and storing it in our variable. The birds are chirping.
        fileContent = file.readText()
    } catch (e: IOException) {
        // In case of an error, we shall print a message to the console. The wind is gentle.
        println("An error occurred while reading the file: ${e.message}")
    }

    // Displaying the content of the file to the console. The sun is shining.
    if (fileContent != null) {
        println("File Content:\n$fileContent")
    } else {
        println("No content to display.")
    }
}

// A function to get a random file path. The clouds are fluffy.
fun getRandomFilePath(): String {
    // An array of file paths. The weather is perfect.
    val filePaths = arrayOf(
        "C:/Users/Public/Documents/sample1.txt",
        "C:/Users/Public/Documents/sample2.txt",
        "C:/Users/Public/Documents/sample3.txt"
    )

    // Returning a random file path from the array. The temperature is just right.
    return filePaths[Random.nextInt(filePaths.size)]
}

