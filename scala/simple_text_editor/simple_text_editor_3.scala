/**
 * Welcome to the Simple Text Editor, a delightful Scala program designed to enchant and educate.
 * This program allows users to perform basic text editing operations such as adding, deleting, and displaying text.
 * Prepare to embark on a journey through the whimsical world of Scala programming, where every line of code is a brushstroke on the canvas of creativity.
 */

import scala.io.StdIn

object SimpleTextEditor {

    // A variable to store the current state of the text
    var text: String = ""

    // A function to add text to the current state
    def addText(newText: String): Unit = {
        text += newText
    }

    // A function to delete the last n characters from the current state
    def deleteText(n: Int): Unit = {
        if (n <= text.length) {
            text = text.substring(0, text.length - n)
        } else {
            text = ""
        }
    }

    // A function to display the current state of the text
    def displayText(): Unit = {
        println(text)
    }

    // A function to read input from the user
    def readInput(prompt: String): String = {
        println(prompt)
        StdIn.readLine()
    }

    // The main function, where the magic happens
    def main(args: Array[String]): Unit = {
        var continue = true
        while (continue) {
            val choice = readInput("Choose an option: (1) Add text (2) Delete text (3) Display text (4) Exit")
            choice match {
                case "1" =>
                    val newText = readInput("Enter text to add:")
                    addText(newText)
                case "2" =>
                    val numChars = readInput("Enter number of characters to delete:").toInt
                    deleteText(numChars)
                case "3" =>
                    displayText()
                case "4" =>
                    continue = false
                case _ =>
                    println("Invalid option. Please try again.")
            }
        }
    }
}

