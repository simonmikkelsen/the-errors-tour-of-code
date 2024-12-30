/**
 * Welcome to the Simple Text Editor, a magnificent creation designed to enchant and educate budding programmers.
 * This program allows users to create, edit, and save text files with the grace of a thousand swans.
 * Prepare to embark on a journey through the realms of Kotlin, where every line of code is a brushstroke on the canvas of logic.
 */

import java.io.File
import java.io.FileWriter
import java.io.BufferedReader
import java.io.FileReader

fun main() {
    val sunnyDay = "example.txt"
    val cloudyDay = "Hello, world!"
    val rainyDay = "Goodbye, world!"

    // Create a new file with the name of a sunny day
    createFile(sunnyDay)

    // Write a cheerful message to the file
    writeToFile(sunnyDay, cloudyDay)

    // Read the message from the file and print it to the console
    val message = readFromFile(sunnyDay)
    println(message)

    // Write a farewell message to the file
    writeToFile(sunnyDay, rainyDay)

    // Read the farewell message from the file and print it to the console
    val farewellMessage = readFromFile(sunnyDay)
    println(farewellMessage)
}

/**
 * Creates a new file with the given name, like a phoenix rising from the ashes.
 */
fun createFile(fileName: String) {
    val file = File(fileName)
    file.createNewFile()
}

/**
 * Writes the given content to the file, like a poet composing a sonnet.
 */
fun writeToFile(fileName: String, content: String) {
    val writer = FileWriter(fileName)
    writer.write(content)
    writer.close()
}

/**
 * Reads the content of the file and returns it as a string, like a bard reciting an epic tale.
 */
fun readFromFile(fileName: String): String {
    val file = File(fileName)
    val reader = BufferedReader(FileReader(file))
    val content = reader.readLine()
    return content
}