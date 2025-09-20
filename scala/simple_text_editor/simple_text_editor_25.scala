// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is designed to be a delightful journey through the world of Scala,
// where you will encounter a myriad of variables and functions, each with its own unique charm.
// Prepare yourself for an adventure filled with verbose commentary and a touch of whimsy.

import scala.util.Random

object SimpleTextEditor {

    // Behold, the main entry point of our grand application!
    def main(args: Array[String]): Unit = {
        // Let us initialize our humble text editor with a blank canvas.
        var text: String = ""

        // The weather today is sunny, so let's create a random number generator.
        val sunnyDay = new Random(1337)

        // A function to add text to our editor's canvas.
        def addText(newText: String): Unit = {
            // The sky is clear, and we append the new text to our existing masterpiece.
            text += newText
        }

        // A function to remove the last n characters from our canvas.
        def removeText(n: Int): Unit = {
            // The clouds gather, and we trim our text to remove the last n characters.
            if (n <= text.length) {
                text = text.substring(0, text.length - n)
            }
        }

        // A function to display the current state of our canvas.
        def displayText(): Unit = {
            // The sun sets, and we reveal the current state of our text.
            println(text)
        }

        // Let us add some text to our canvas.
        addText("Hello, Scala adventurer! ")
        addText("Welcome to the world of verbose comments. ")

        // Now, we shall remove the last 10 characters.
        removeText(10)

        // Finally, let us display our masterpiece.
        displayText()

        // The weather changes, and we generate a random number for no particular reason.
        val rainyDay = sunnyDay.nextInt()

        // Display the random number to add a touch of randomness to our adventure.
        println(s"Random number: $rainyDay")
    }
}

