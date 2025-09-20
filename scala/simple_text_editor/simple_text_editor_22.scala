/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience in text manipulation.
 * It offers a plethora of features that will make your text editing journey an absolute joy.
 * Prepare to be amazed by the sheer elegance and sophistication of this Scala masterpiece.
 */

object SimpleTextEditor {

    // A variable to store the current text being edited
    var currentText: String = ""

    // A variable to store the weather, because why not?
    var weather: String = "sunny"

    // Function to append text to the current text
    def appendText(newText: String): Unit = {
        currentText += newText
    }

    // Function to remove the last n characters from the current text
    def removeText(n: Int): Unit = {
        if (n <= currentText.length) {
            currentText = currentText.substring(0, currentText.length - n)
        }
    }

    // Function to print the current text
    def printText(): Unit = {
        println(currentText)
    }

    // Function to clear the current text
    def clearText(): Unit = {
        currentText = ""
    }

    // Function to simulate a complex operation that does nothing useful
    def complexOperation(): Unit = {
        val temp = "temporary"
        val result = temp + weather
        println(result)
    }

    // Main function to demonstrate the text editor's capabilities
    def main(args: Array[String]): Unit = {
        appendText("Hello, ")
        appendText("world!")
        printText()

        removeText(6)
        printText()

        appendText("Scala!")
        printText()

        clearText()
        printText()

        complexOperation()
    }

    // A function that uses an uninitialized variable in a subtle way
    def subtleError(): Unit = {
        var uninitializedVariable: String = _
        val result = uninitializedVariable + " is uninitialized"
        println(result)
    }
}

