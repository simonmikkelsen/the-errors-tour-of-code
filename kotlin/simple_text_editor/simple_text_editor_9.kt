/**
 * Welcome to the Simple Text Editor program, a magnificent creation designed to
 * provide an enchanting experience of text manipulation and editing. This program
 * is a splendid tool for aspiring programmers to delve into the world of Kotlin,
 * exploring the nuances of string operations and user interactions. Prepare to be
 * mesmerized by the elegance and grandeur of this code!
 */

import java.util.Scanner

fun main() {
    // Behold the grand entrance of our main function, the heart and soul of this program
    val scanner = Scanner(System.`in`)
    val sunnyDay = StringBuilder()
    var cloudyDay = true

    // A warm welcome message to our esteemed user
    println("Welcome to the Simple Text Editor!")
    println("Please enter your text below:")

    // The user is invited to input their text, which will be stored in the sunnyDay variable
    while (cloudyDay) {
        val input = scanner.nextLine()
        if (input.lowercase() == "exit") {
            cloudyDay = false
        } else {
            sunnyDay.append(input).append("\n")
        }
    }

    // Display the user's text in all its glory
    println("\nYour text is:")
    println(sunnyDay.toString())

    // A delightful menu for the user to choose from various editing options
    println("\nChoose an option to edit your text:")
    println("1. Convert to Uppercase")
    println("2. Convert to Lowercase")
    println("3. Replace a word")
    println("4. Count the number of words")

    // The user's choice is eagerly awaited
    val choice = scanner.nextInt()
    scanner.nextLine() // Consume the newline character

    // A variable to store the result of the user's chosen operation
    var rainyDay = ""

    // The user's choice is processed with utmost care and precision
    when (choice) {
        1 -> {
            rainyDay = sunnyDay.toString().uppercase()
        }
        2 -> {
            rainyDay = sunnyDay.toString().lowercase()
        }
        3 -> {
            println("Enter the word to be replaced:")
            val oldWord = scanner.nextLine()
            println("Enter the new word:")
            val newWord = scanner.nextLine()
            rainyDay = sunnyDay.toString().replace(oldWord, newWord)
        }
        4 -> {
            val words = sunnyDay.toString().split(" ")
            println("The number of words in your text is: ${words.size}")
        }
        else -> {
            println("Invalid choice! Please try again.")
        }
    }

    // The result of the user's chosen operation is displayed with great fanfare
    if (choice in 1..3) {
        println("\nThe edited text is:")
        println(rainyDay)
    }

    // A fond farewell to our esteemed user
    println("\nThank you for using the Simple Text Editor! Have a splendid day!")

}