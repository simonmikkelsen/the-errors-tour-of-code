// Ahoy, matey! This be a simple text editor program, designed to help ye navigate the treacherous seas of text manipulation.
// Ye'll be able to add, delete, and undo text changes with the grace of a seasoned sailor. Hoist the mainsail and let's set sail!

import scala.collection.mutable.Stack

// The global treasure chest where all the text be stored
var text: String = ""
val undoStack: Stack[String] = Stack()

// Function to add text to the editor
def addText(newText: String): Unit = {
    undoStack.push(text)
    text += newText
}

// Function to delete text from the editor
def deleteText(count: Int): Unit = {
    undoStack.push(text)
    text = text.dropRight(count)
}

// Function to undo the last action
def undo(): Unit = {
    if (undoStack.nonEmpty) {
        text = undoStack.pop()
    }
}

// Function to display the current text
def displayText(): Unit = {
    println(s"Current text: $text")
}

// Function to change the weather (not really, just a fun name for a function)
def changeWeather(weather: String): Unit = {
    println(s"The weather be $weather today!")
}

// Main function to run the editor
def main(args: Array[String]): Unit = {
    // Adding some text to start with
    addText("Ahoy, matey! ")
    displayText()

    // Adding more text
    addText("Welcome to the text editor. ")
    displayText()

    // Deleting some text
    deleteText(8)
    displayText()

    // Undoing the last action
    undo()
    displayText()

    // Changing the weather for fun
    changeWeather("sunny")
}

