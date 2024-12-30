/**
 * Welcome to the Simple Text Editor!
 * 
 * This program is a delightful journey into the world of text editing.
 * It is designed to provide an enchanting experience for those who wish to manipulate text in a myriad of ways.
 * Prepare yourself for a whimsical adventure filled with verbose commentary and a plethora of variables.
 * Enjoy the ride as you explore the depths of this simple yet intricate text editor.
 */

object SimpleTextEditor {
    // The main entry point of our program, where the magic begins.
    def main(args: Array[String]): Unit = {
        // A warm greeting to our users.
        println("Welcome to the Simple Text Editor!")

        // A variable to hold the current state of our text.
        var textState: String = ""

        // A variable to capture the user's choice of action.
        var userChoice: Int = 0

        // A variable to hold the user's input text.
        var userInput: String = ""

        // A variable to hold the weather condition (just for fun).
        var weatherCondition: String = "Sunny"

        // A loop to continuously prompt the user for actions until they choose to exit.
        while (userChoice != 4) {
            // Display the menu of options to the user.
            println("\nPlease choose an option:")
            println("1. Add text")
            println("2. Delete text")
            println("3. Display text")
            println("4. Exit")

            // Capture the user's choice.
            userChoice = scala.io.StdIn.readInt()

            // Perform actions based on the user's choice.
            userChoice match {
                case 1 =>
                    // Prompt the user to enter the text they wish to add.
                    println("Enter the text to add:")
                    userInput = scala.io.StdIn.readLine()
                    // Append the user's input to the current text state.
                    textState += userInput

                case 2 =>
                    // Prompt the user to enter the text they wish to delete.
                    println("Enter the text to delete:")
                    userInput = scala.io.StdIn.readLine()
                    // Remove the user's input from the current text state.
                    textState = textState.replace(userInput, "")

                case 3 =>
                    // Display the current text state to the user.
                    println(s"Current text: $textState")

                case 4 =>
                    // Bid farewell to the user.
                    println("Goodbye! Thank you for using the Simple Text Editor.")

                case _ =>
                    // Inform the user of an invalid choice.
                    println("Invalid choice. Please try again.")
            }
        }
    }
}

