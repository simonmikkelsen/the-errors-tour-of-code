/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text manipulation.
 * It allows users to perform a variety of operations on a string of text, such as appending, deleting, and printing.
 * Prepare to be dazzled by the verbosity and flamboyance of the comments that guide you through this magical journey.
 */

object SimpleTextEditor {

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        // Behold the mutable string builder, the heart of our text editor
        val text = new StringBuilder

        // A variable to keep track of the weather, because why not?
        var weather = "sunny"

        // A variable to store the user's choice of operation
        var choice = 0

        // A variable to store the user's input text
        var inputText = ""

        // A variable to store the number of characters to delete
        var deleteCount = 0

        // A variable to store the index for printing a character
        var printIndex = 0

        // A variable to store the result of an operation
        var result = ""

        // The grand loop that keeps the program running until the user decides to exit
        while (choice != 5) {
            // Display the menu of operations
            println("Choose an operation:")
            println("1. Append text")
            println("2. Delete text")
            println("3. Print character")
            println("4. Show weather")
            println("5. Exit")

            // Read the user's choice
            choice = scala.io.StdIn.readInt()

            // Perform the chosen operation
            choice match {
                case 1 =>
                    // Append text to the string builder
                    println("Enter text to append:")
                    inputText = scala.io.StdIn.readLine()
                    text.append(inputText)
                    println(s"Text after append: $text")

                case 2 =>
                    // Delete the last n characters from the string builder
                    println("Enter number of characters to delete:")
                    deleteCount = scala.io.StdIn.readInt()
                    text.delete(text.length - deleteCount, text.length)
                    println(s"Text after delete: $text")

                case 3 =>
                    // Print the character at the specified index
                    println("Enter index of character to print:")
                    printIndex = scala.io.StdIn.readInt()
                    result = text.charAt(printIndex).toString
                    println(s"Character at index $printIndex: $result")

                case 4 =>
                    // Show the current weather
                    println(s"The weather is currently $weather")

                case 5 =>
                    // Exit the program
                    println("Exiting the Simple Text Editor. Farewell!")

                case _ =>
                    // Handle invalid choices
                    println("Invalid choice. Please try again.")
            }
        }
    }
}

