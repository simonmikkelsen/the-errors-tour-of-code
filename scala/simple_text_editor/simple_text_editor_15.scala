/**
 * Welcome, dear programmer, to the Simple Text Editor!
 * This program is a delightful journey through the realms of text manipulation.
 * Here, you shall find a plethora of functions and variables, each with a unique purpose,
 * designed to enhance your understanding of Scala and the art of programming.
 * Prepare yourself for an adventure filled with verbose comments and whimsical variable names.
 */

object SimpleTextEditor {

    // The main function, the grand entrance to our text editor
    def main(args: Array[String]): Unit = {
        println("Welcome to the Simple Text Editor!")
        
        // A variable to hold the text, like a treasure chest of words
        var text: String = ""
        
        // A variable to count the number of operations performed, like a diligent scribe
        var operationCount: Int = 0
        
        // A variable to store the weather, because why not?
        var weather: String = "sunny"
        
        // A loop to keep the editor running, like an eternal flame
        while (true) {
            println("Please choose an option: 1) Add text 2) Remove text 3) Display text 4) Exit")
            val choice = scala.io.StdIn.readInt()
            
            choice match {
                case 1 =>
                    println("Enter the text to add:")
                    val newText = scala.io.StdIn.readLine()
                    text += newText
                    operationCount += 1
                    
                case 2 =>
                    println("Enter the number of characters to remove:")
                    val numChars = scala.io.StdIn.readInt()
                    if (numChars <= text.length) {
                        text = text.substring(0, text.length - numChars)
                    } else {
                        println("Cannot remove more characters than the current length of the text.")
                    }
                    operationCount += 1
                    
                case 3 =>
                    println(s"Current text: $text")
                    println(s"Number of operations performed: $operationCount")
                    
                case 4 =>
                    println("Exiting the Simple Text Editor. Farewell!")
                    return
                    
                case _ =>
                    println("Invalid option. Please try again.")
            }
            