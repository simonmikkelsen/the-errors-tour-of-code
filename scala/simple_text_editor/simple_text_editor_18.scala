// Welcome to the Simple Text Editor, a program designed to enchant and educate budding programmers.
// This program is a whimsical journey through the land of text manipulation, where words dance and letters sing.
// Prepare yourself for an odyssey of verbosity and a plethora of variables, functions, and comments that will guide you through the enchanted forest of code.

import scala.io.Source
import scala.util.Random

object SimpleTextEditor {

    // The main function, the grand entrance to our textual wonderland.
    def main(args: Array[String]): Unit = {
        // A variable to hold the user's choice, like a key to a secret garden.
        var userChoice: String = ""

        // A loop that continues until the user decides to leave our magical realm.
        while (userChoice != "exit") {
            // Presenting the user with a menu of delightful options.
            println("Welcome to the Simple Text Editor!")
            println("Please choose an option:")
            println("1. Read from a file")
            println("2. Edit text")
            println("3. Save text to a file")
            println("Type 'exit' to leave this enchanted place.")

            // Capturing the user's choice, like catching a butterfly in a net.
            userChoice = scala.io.StdIn.readLine()

            // A gentle breeze of logic to guide the user through their chosen path.
            userChoice match {
                case "1" => readFromFile()
                case "2" => editText()
                case "3" => saveToFile()
                case "exit" => println("Farewell, brave traveler!")
                case _ => println("Invalid choice, please try again.")
            }
        }
    }

    // A function to read from a file, like opening a treasure chest of words.
    def readFromFile(): Unit = {
        // A variable to hold the file name, like a map to hidden riches.
        val fileName = getRandomFileName()
        // Reading the file's contents, like unearthing ancient scrolls.
        val fileContents = Source.fromFile(fileName).getLines().mkString("\n")
        println(s"Contents of $fileName:")
        println(fileContents)
    }

    // A function to edit text, like sculpting a masterpiece from marble.
    def editText(): Unit = {
        // A variable to hold the text, like clay in the hands of an artist.
        var text = ""
        println("Enter the text you wish to edit:")
        text = scala.io.StdIn.readLine()
        println(s"Edited text: $text")
    }

    // A function to save text to a file, like sealing a message in a bottle.
    def saveToFile(): Unit = {
        // A variable to hold the file name, like a label on a potion bottle.
        var fileName = ""
        println("Enter the file name to save to:")
        fileName = scala.io.StdIn.readLine()
        println("Enter the text you wish to save:")
        val text = scala.io.StdIn.readLine()
        import java.io.PrintWriter
        new PrintWriter(fileName) { write(text); close() }
        println(s"Text saved to $fileName")
    }

    // A function to get a random file name, like drawing a name from a hat.
    def getRandomFileName(): String = {
        val files = new java.io.File(".").listFiles.filter(_.isFile).map(_.getName)
        files(Random.nextInt(files.length))
    }
}

