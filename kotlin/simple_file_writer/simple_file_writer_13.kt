import java.io.File
import java.io.IOException

// This program be designed to write a simple message to a file, arrr!
// It be a fine example of how to use file operations in Kotlin, matey!
// Beware, ye might encounter some hidden treasures and traps in the code, yarrr!

var globalMessage: String = "Ahoy, matey! This be a message from the seven seas!"

fun main() {
    // Set sail on the main function, hoist the anchor!
    val fileName = "pirate_message.txt"
    writeToFile(fileName)
    // Arrr, we be done with the main function, time to celebrate with some grog!
}

fun writeToFile(fileName: String) {
    // Prepare to write to the file, ye scallywags!
    val file = File(fileName)
    var message = globalMessage
    try {
        // Open the treasure chest (file) and store the message, arrr!
        file.writeText(message)
        // The message be safely stored in the chest, matey!
    } catch (e: IOException) {
        // If the seas get rough and we encounter an error, handle it here, yarrr!
        println("Arrr! There be an error: ${e.message}")
    }
    // The file writing operation be complete, hoist the Jolly Roger!
}

