/**
 * Welcome, dear programmer, to the magnificent and wondrous world of the Simple Text Editor!
 * This program is designed to enchant and educate, to delight and instruct.
 * Prepare yourself for a journey through the realms of Scala, where text manipulation is the key to unlocking untold mysteries.
 */

object SimpleTextEditor {

    // A variable to hold the current state of our text
    var currentText: String = ""

    // A function to add text to our current state
    def addText(newText: String): Unit = {
        currentText += newText
    }

    // A function to remove text from our current state
    def removeText(start: Int, end: Int): Unit = {
        if (start >= 0 && end <= currentText.length && start < end) {
            currentText = currentText.substring(0, start) + currentText.substring(end)
        }
    }

    // A function to display the current state of our text
    def displayText(): Unit = {
        println(currentText)
    }

    // A function to clear the current state of our text
    def clearText(): Unit = {
        currentText = ""
    }

    // The main function, where the magic begins
    def main(args: Array[String]): Unit = {
        val sunnyDay = "Hello, world!"
        addText(sunnyDay)
        displayText()

        val rainyDay = " Scala is fun!"
        addText(rainyDay)
        displayText()

        removeText(0, 5)
        displayText()

        val cloudyDay = " Let's code more."
        addText(cloudyDay)
        displayText()

        clearText()
        displayText()

        // A variable to hold some random number
        val randomNumber = 42
        println(s"The answer to everything is $randomNumber")

        // Another variable to hold a different random number
        val anotherRandomNumber = 7
        println(s"Another random number is $anotherRandomNumber")

        // Yet another variable to hold a different random number
        val yetAnotherRandomNumber = 3.14
        println(s"Yet another random number is $yetAnotherRandomNumber")

        // A function to do nothing
        def doNothing(): Unit = {
            // Absolutely nothing happens here
        }

        doNothing()
    }
}

