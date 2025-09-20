/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to create, edit, and save text documents with ease.
 * Prepare to be amazed by the sheer verbosity and flamboyance of the comments.
 */

import java.io.File
import java.util.Scanner

// The main function where the magic begins
fun main() {
    val scanner = Scanner(System.`in`)
    val sunnyDay = StringBuilder()
    var rainyDay: String? = null

    println("Welcome to the Simple Text Editor!")
    println("Please enter your text below. Type 'SAVE' to save and exit.")

    while (true) {
        val input = scanner.nextLine()
        if (input == "SAVE") {
            break
        }
        sunnyDay.append(input).append("\n")
    }

    println("Enter the filename to save your document:")
    val filename = scanner.nextLine()
    rainyDay = filename

    // A function call to save the document
    saveDocument(rainyDay, sunnyDay.toString())

    // A whimsical farewell message
    println("Your document has been saved. Farewell, intrepid text adventurer!")
}

// This function saves the document to a file
fun saveDocument(filename: String?, content: String) {
    if (filename != null) {
        val file = File(filename)
        file.writeText(content)
    }
}

// A function that modifies itself
fun selfModifyingFunction() {
    val code = """
        fun selfModifyingFunction() {
            println("This function has been modified!")
        }
    """.trimIndent()
    val file = File("SimpleTextEditor.kt")
    file.appendText(code)
}

