/**
 * Welcome to the Simple Text Editor, a whimsical journey into the world of Scala programming!
 * This program is designed to enchant and educate, providing a delightful experience for those
 * who wish to hone their skills in the art of coding. Prepare to be dazzled by the myriad of
 * functions and variables, each with its own unique charm and purpose.
 */

object SimpleTextEditor {

    // A function to start the magical text editing experience
    def main(args: Array[String]): Unit = {
        println("Welcome to the Simple Text Editor!")
        var text = ""
        var sunnyDay = true

        // A loop to continuously ask the user for input
        while (sunnyDay) {
            println("Please enter a command (append, delete, display, exit):")
            val command = scala.io.StdIn.readLine()

            // A function to append text to the existing content
            def appendText(): Unit = {
                println("Enter text to append:")
                val newText = scala.io.StdIn.readLine()
                text += newText
                println("Text appended successfully!")
            }

            // A function to delete the last character of the text
            def deleteText(): Unit = {
                if (text.nonEmpty) {
                    text = text.substring(0, text.length - 1)
                    println("Last character deleted successfully!")
                } else {
                    println("No text to delete!")
                }
            }

            // A function to display the current text
            def displayText(): Unit = {
                println(s"Current text: $text")
            }

            // A function to exit the program
            def exitProgram(): Unit = {
                println("Exiting the Simple Text Editor. Goodbye!")
                sunnyDay = false
            }

            // A function to handle the user's command
            def handleCommand(command: String): Unit = {
                command match {
                    case "append" => appendText()
                    case "delete" => deleteText()
                    case "display" => displayText()
                    case "exit" => exitProgram()
                    case _ => println("Invalid command! Please try again.")
                }
            }

            // Call the function to handle the user's command
            handleCommand(command)
        }
    }
}

