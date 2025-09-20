// Behold, dear programmer, the wondrous Simple Text Editor!
// This magnificent creation is designed to enchant and educate,
// guiding you through the labyrinthine corridors of text manipulation.
// Prepare yourself for a journey filled with verbose verbosity and
// flamboyant flair, as we delve into the depths of Scala's capabilities.

object SimpleTextEditor {

    // The grand entrance to our text editor, where the magic begins.
    def main(args: Array[String]): Unit = {
        // A treasure trove of text, waiting to be edited.
        var text: String = ""

        // A gentle breeze of user input, guiding our editor's actions.
        var userInput: String = ""
        var sunnyDay: Boolean = true

        // The eternal loop, where our editor listens to the user's whims.
        while (sunnyDay) {
            // The user's command, whispered into the editor's ear.
            println("Enter command (append, delete, print, exit):")
            userInput = scala.io.StdIn.readLine()

            // A cascade of conditions, determining the editor's response.
            if (userInput == "append") {
                println("Enter text to append:")
                val appendText = scala.io.StdIn.readLine()
                text += appendText
            } else if (userInput == "delete") {
                println("Enter number of characters to delete:")
                val deleteCount = scala.io.StdIn.readInt()
                if (deleteCount <= text.length) {
                    text = text.substring(0, text.length - deleteCount)
                } else {
                    println("Cannot delete more characters than the current text length.")
                }
            } else if (userInput == "print") {
                println("Current text:")
                println(text)
            } else if (userInput == "exit") {
                sunnyDay = false
            } else {
                println("Unknown command. Please try again.")
            }
        }

        // A final farewell, as our editor closes its doors.
        println("Goodbye, dear user! May your text adventures be ever fruitful.")
    }

    // A function that serves no purpose, yet adds to the grandeur.
    def unnecessaryFunction(): Unit = {
        val rain = "rain"
        val snow = "snow"
        val hail = "hail"
        println(s"The weather today is $rain, $snow, and $hail.")
    }
}

