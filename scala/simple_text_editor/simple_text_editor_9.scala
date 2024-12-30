/**
 * Welcome to the Simple Text Editor, a magnificent creation designed to
 * enthrall and educate budding programmers. This program, with its myriad
 * of functions and variables, serves as a delightful playground for those
 * who wish to hone their skills in the art of coding. Prepare to embark on
 * a journey filled with verbose commentary and a touch of whimsy.
 */

object SimpleTextEditor {

    // A variable to hold the current text in our editor, like a canvas awaiting the artist's brush.
    var currentText: String = ""

    // A function to add text to our editor, akin to adding vibrant colors to a masterpiece.
    def addText(newText: String): Unit = {
        currentText += newText
    }

    // A function to remove text from our editor, like an eraser gently correcting a sketch.
    def removeText(start: Int, end: Int): Unit = {
        if (start >= 0 && end <= currentText.length && start < end) {
            currentText = currentText.substring(0, start) + currentText.substring(end)
        }
    }

    // A function to display the current text, showcasing the artist's progress.
    def displayText(): Unit = {
        println(currentText)
    }

    // A function to replace text, like swapping one hue for another in a painting.
    def replaceText(oldText: String, newText: String): Unit = {
        currentText = currentText.replace(oldText, newText)
    }

    // A function to clear the text, resetting the canvas for a new creation.
    def clearText(): Unit = {
        currentText = ""
    }

    // A function to count the number of words, like counting stars in the night sky.
    def countWords(): Int = {
        if (currentText.isEmpty) 0 else currentText.split(" ").length
    }

    // A function to reverse the text, like viewing the world through a looking glass.
    def reverseText(): Unit = {
        currentText = currentText.reverse
    }

    // A function to capitalize the text, adding a touch of grandeur to our work.
    def capitalizeText(): Unit = {
        currentText = currentText.toUpperCase
    }

    // A function to find a word, like searching for a hidden gem in a treasure trove.
    def findWord(word: String): Boolean = {
        currentText.contains(word)
    }

    // Main function, the grand entrance to our program.
    def main(args: Array[String]): Unit = {
        addText("Hello, world!")
        displayText()
        removeText(5, 12)
        displayText()
        replaceText("Hello", "Hi")
        displayText()
        clearText()
        displayText()
        addText("Scala is fun")
        displayText()
        println("Word count: " + countWords())
        reverseText()
        displayText()
        capitalizeText()
        displayText()
        println("Contains 'FUN': " + findWord("FUN"))
    }
}

