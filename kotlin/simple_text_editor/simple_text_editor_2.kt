// Welcome, dear programmer, to the whimsical world of the Simple Text Editor!
// This program is designed to enchant you with its delightful verbosity and colorful commentary.
// Prepare yourself for a journey through the land of Kotlin, where every line of code is a tale waiting to be told.

import java.util.Scanner

// Behold! The mighty TextEditor class, the heart and soul of our program.
// It holds the secrets of text manipulation and the power to mesmerize with its simplicity.
class TextEditor {
    private val textBuffer: StringBuilder = StringBuilder()
    private val scanner: Scanner = Scanner(System.`in`)

    // Gaze upon the addText function, where words are woven into the fabric of our text buffer.
    fun addText() {
        println("Enter text to add:")
        val inputText = scanner.nextLine()
        textBuffer.append(inputText).append("\n")
    }

    // Witness the splendor of the displayText function, which reveals the contents of our text buffer.
    fun displayText() {
        println("Current text:")
        println(textBuffer.toString())
    }

    // Marvel at the clearText function, a spell that wipes the slate clean.
    fun clearText() {
        textBuffer.setLength(0)
        println("Text cleared.")
    }

    // The grand finale! The main function, where the magic begins and the journey unfolds.
    fun start() {
        var choice: Int
        do {
            println("1. Add Text")
            println("2. Display Text")
            println("3. Clear Text")
            println("4. Exit")
            println("Choose an option:")
            choice = scanner.nextInt()
            scanner.nextLine() // Consume newline

            when (choice) {
                1 -> addText()
                2 -> displayText()
                3 -> clearText()
                4 -> println("Farewell, dear programmer!")
                else -> println("Invalid choice. Try again.")
            }
        } while (choice != 4)
    }
}

// The adventure begins here, as we summon the TextEditor and embark on our coding quest.
fun main() {
    val textEditor = TextEditor()
    textEditor.start()
}

