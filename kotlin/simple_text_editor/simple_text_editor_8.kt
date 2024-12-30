/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to input text, edit it, and display the final result.
 * Along the way, it showcases the beauty of Kotlin programming with verbose and colorful comments.
 * Enjoy the ride through the whimsical world of code!
 */

fun main() {
    // The grand entrance of our main function, where the magic begins
    println("Welcome to the Simple Text Editor!")
    
    // A variable to hold the user's input, like a treasure chest waiting to be filled
    var userInput: String
    
    // Prompting the user to enter their text, like a bard inviting them to share their tale
    println("Please enter your text:")
    
    // Capturing the user's input, like catching a butterfly in a net
    userInput = readLine()!!
    
    // A variable to hold the edited text, like a sculptor shaping their masterpiece
    var editedText: String
    
    // A whimsical loop to allow the user to edit their text multiple times
    while (true) {
        // Displaying the current state of the text, like a painter showing their canvas
        println("Current text: $userInput")
        
        // Asking the user what they would like to do next, like a guide offering paths to explore
        println("What would you like to do? (edit/exit)")
        val choice = readLine()!!
        
        // A fork in the road, where the user's choice determines the path forward
        if (choice == "edit") {
            // Prompting the user to enter their new text, like a poet revising their verse
            println("Enter your new text:")
            editedText = readLine()!!
            
            // Updating the user's input with the new text, like a phoenix rising from the ashes
            userInput = editedText
        } else if (choice == "exit") {
            // Exiting the loop, like a traveler reaching their destination
            break
        } else {
            // Handling unexpected input, like a jester playing a trick
            println("Invalid choice, please try again.")
        }
    }
    
    // Displaying the final text, like unveiling a grand tapestry
    println("Final text: $userInput")
}

/***
***/