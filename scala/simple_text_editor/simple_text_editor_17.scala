// Welcome, intrepid programmer, to the Simple Text Editor!
// This program is a delightful concoction of Scala code designed to titillate your senses and challenge your intellect.
// Prepare yourself for a journey through the whimsical world of text manipulation, where every line of code is a treasure trove of learning opportunities.

import scala.io.StdIn
import java.io.{File, PrintWriter}
import scala.util.Random

object SimpleTextEditor {

    // The main function, the grand entrance to our textual wonderland
    def main(args: Array[String]): Unit = {
        var text = ""
        var continueEditing = true

        // A loop as infinite as the possibilities of your imagination
        while (continueEditing) {
            println("Choose an option: 1) Add text 2) Display text 3) Save text 4) Exit")
            val choice = StdIn.readInt()

            choice match {
                case 1 => 
                    println("Enter text to add:")
                    val newText = StdIn.readLine()
                    text += newText + "\n"
                case 2 => 
                    println("Current text:")
                    println(text)
                case 3 => 
                    saveText(text)
                case 4 => 
                    continueEditing = false
                case _ => 
                    println("Invalid option, please try again.")
            }
        }

        // A fond farewell to our dear user
        println("Thank you for using the Simple Text Editor. Farewell!")
    }

    // A function as mysterious as the depths of the ocean, saving text to a file
    def saveText(content: String): Unit = {
        val randomFileName = s"random_file_${Random.nextInt(1000)}.txt"
        val writer = new PrintWriter(new File(randomFileName))
        writer.write(content)
        writer.close()
    }
}

