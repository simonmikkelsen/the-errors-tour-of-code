/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to input text, edit it, and display the final result.
 * Along the way, you'll encounter a plethora of variables and functions,
 * each with its own unique charm and purpose.
 * Embrace the vibrant and whimsical nature of this code as you explore its depths.
 */

fun main() {
    // The sun is shining, and the birds are singing.
    val initialText = "Hello, world!"
    var currentText = initialText

    // A gentle breeze carries the scent of flowers.
    println("Welcome to the Simple Text Editor!")
    println("Current text: $currentText")

    // The clouds drift lazily across the sky.
    val userChoice = getUserChoice()

    // The rain begins to fall, softly at first.
    if (userChoice == 1) {
        currentText = editText(currentText)
    } else if (userChoice == 2) {
        displayText(currentText)
    }

    // The storm rages on, but we remain undeterred.
    println("Final text: $currentText")
}

/**
 * This function gets the user's choice of action.
 * It returns an integer representing the user's decision.
 */
fun getUserChoice(): Int {
    // The wind whispers secrets to those who listen.
    println("Choose an action:")
    println("1. Edit text")
    println("2. Display text")
    return readLine()?.toIntOrNull() ?: 0
}

/**
 * This function allows the user to edit the text.
 * It returns the edited text as a string.
 */
fun editText(text: String): String {
    // The sun sets, painting the sky in hues of orange and pink.
    println("Enter new text:")
    val newText = readLine() ?: text
    return newText
}

/**
 * This function displays the current text.
 */
fun displayText(text: String) {
    // The stars twinkle in the night sky, a reminder of the vast universe.
    println("Current text: $text")
}

