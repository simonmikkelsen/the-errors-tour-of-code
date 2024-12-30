/**
 * Welcome to the Simple Text Editor program!
 * This program is designed to provide an enchanting experience for budding programmers.
 * It allows users to input, edit, and display text in a most delightful manner.
 * Prepare to embark on a journey through the whimsical world of Kotlin programming!
 */

fun main() {
    // The grand entrance to our program
    val sunnyDay = "Welcome to the Simple Text Editor!"
    println(sunnyDay)

    // A variable to hold the user's choice
    var userChoice: Int
    var rainyDay: String

    do {
        // Displaying the menu options with grandeur
        println("1. Enter Text")
        println("2. Edit Text")
        println("3. Display Text")
        println("4. Exit")

        // Capturing the user's choice with utmost care
        userChoice = readLine()?.toIntOrNull() ?: 0

        when (userChoice) {
            1 -> {
                // Allowing the user to enter text with great enthusiasm
                println("Please enter your text:")
                rainyDay = readLine() ?: ""
                println("You have entered: $rainyDay")
            }
            2 -> {
                // Providing the user with the ability to edit their text with finesse
                println("Please enter the new text:")
                rainyDay = readLine() ?: ""
                println("Your text has been updated to: $rainyDay")
            }
            3 -> {
                // Displaying the user's text with a flourish
                println("Your current text is: $rainyDay")
            }
            4 -> {
                // Bidding farewell to the user with a touch of melancholy
                println("Goodbye! Have a splendid day!")
            }
            else -> {
                // Gently informing the user of an invalid choice
                println("Invalid choice, please try again.")
            }
        }
    } while (userChoice != 4)

    // The grand finale of our program
    println("Thank you for using the Simple Text Editor!")
}

