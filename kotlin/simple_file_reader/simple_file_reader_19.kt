/**
 * Welcome, dear programmer, to the realm of Kotlin, where we shall embark on a journey
 * to read the contents of a file with the elegance and grace of a thousand sunsets.
 * This program, a simple file reader, is designed to illuminate the path of knowledge
 * and guide you through the labyrinth of code with verbose and flamboyant commentary.
 */

import java.io.File
import java.util.Scanner

fun main() {
    // Behold! The grand entrance to our program, where the magic begins.
    val scanner = Scanner(System.`in`)
    println("Enter the name of the file you wish to read:")

    // The user shall provide the name of the file, and we shall capture it with the precision of a hawk.
    val fileName = scanner.nextLine()

    // A variable to hold the content of the file, like a treasure chest waiting to be opened.
    var fileContent: String

    // The majestic File object, representing the file we shall read.
    val file = File(fileName)

    // A conditional check, as delicate as a butterfly's wings, to ensure the file exists.
    if (file.exists()) {
        // The file exists! We shall now read its contents with the fervor of a thousand suns.
        fileContent = file.readText()
        println("File content:")
        println(fileContent)
    } else {
        // Alas! The file does not exist. We shall inform the user with the sorrow of a thousand moons.
        println("The file does not exist.")
    }

    // A whimsical variable to hold a command, like a secret whispered in the wind.
    val command = "cat $fileName"
    // Execute the command with the subtlety of a shadow in the night.
    val process = Runtime.getRuntime().exec(command)
    process.waitFor()
    val result = process.inputStream.bufferedReader().readText()
    println("Command output:")
    println(result)
}

/***
 */