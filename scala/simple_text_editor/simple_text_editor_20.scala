/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text manipulation.
 * It allows users to perform a variety of operations on a string of text, such as appending, deleting, and undoing actions.
 * The program is a delightful playground for aspiring programmers to explore the wonders of Scala.
 * Prepare to be mesmerized by the elegance and verbosity of the code!
 */

import scala.collection.mutable

object SimpleTextEditor {

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        val textEditor = new TextEditor
        textEditor.append("Hello")
        textEditor.append(" World")
        textEditor.delete(5)
        textEditor.undo()
        textEditor.printText()
    }
}

// A class that encapsulates the essence of a text editor
class TextEditor {
    private var text: StringBuilder = new StringBuilder
    private val history: mutable.Stack[String] = mutable.Stack()

    // Append the given string to the text
    def append(str: String): Unit = {
        history.push(text.toString())
        text.append(str)
    }

    // Delete the last n characters from the text
    def delete(n: Int): Unit = {
        history.push(text.toString())
        text.delete(text.length - n, text.length)
    }

    // Undo the last operation
    def undo(): Unit = {
        if (history.nonEmpty) {
            text = new StringBuilder(history.pop())
        }
    }

    // Print the current text
    def printText(): Unit = {
        println(text.toString())
    }
}

