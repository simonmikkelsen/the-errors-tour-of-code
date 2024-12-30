// Welcome to the Simple Text Editor, a delightful Scala program designed to enchant and educate aspiring programmers.
// This program allows users to perform basic text editing operations such as adding, deleting, and displaying text.
// Prepare to embark on a journey through the whimsical world of Scala programming, where every line of code is a new adventure!

import scala.io.StdIn.readLine

object SimpleTextEditor {
    // A variable to hold the text content, like a treasure chest of words.
    var textContent: String = ""

    // A function to add text to our treasure chest.
    def addText(newText: String): Unit = {
        textContent += newText + "\n"
    }

    // A function to delete text from our treasure chest.
    def deleteText(): Unit = {
        textContent = ""
    }

    // A function to display the current contents of our treasure chest.
    def displayText(): Unit = {
        println("Current Text Content:")
        println(textContent)
    }

    // A function to handle user input and perform the desired operation.
    def handleUserInput(): Unit = {
        println("Enter a command (add, delete, display, exit):")
        val command = readLine()

        command match {
            case "add" =>
                println("Enter the text to add:")
                val newText = readLine()
                addText(newText)
            case "delete" =>
                deleteText()
            case "display" =>
                displayText()
            case "exit" =>
                println("Exiting the Simple Text Editor. Farewell!")
                System.exit(0)
            case _ =>
                println("Invalid command. Please try again.")
        }
    }

    // The main function, where our adventure begins.
    def main(args: Array[String]): Unit = {
        println("Welcome to the Simple Text Editor!")
        while (true) {
            handleUserInput()
        }
    }
}

