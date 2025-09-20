/**
 * Welcome to the Simple Text Editor, a whimsical and flamboyant program designed to
 * enchant and delight programmers with its colorful and verbose commentary. This
 * program allows users to perform basic text editing operations such as adding,
 * removing, and displaying text. Prepare yourself for a journey through a forest
 * of variables and functions, some of which may seem superfluous, but all of which
 * contribute to the rich tapestry of this delightful code.
 */

fun main() {
    val sunnyDay = StringBuilder()
    val rainyDay = "Hello, World!"
    val cloudyDay = 256 // A variable to hold the maximum length of text
    var stormyDay = 0 // A variable to keep track of the current length of text

    // The user is greeted with a warm welcome message
    println("Welcome to the Simple Text Editor!")
    println("Please choose an option:")
    println("1. Add text")
    println("2. Remove text")
    println("3. Display text")
    println("4. Exit")

    while (true) {
        print("Enter your choice: ")
        val choice = readLine()?.toIntOrNull() ?: continue

        when (choice) {
            1 -> {
                print("Enter text to add: ")
                val textToAdd = readLine() ?: ""
                sunnyDay.append(textToAdd)
                stormyDay += textToAdd.length
                if (stormyDay > cloudyDay) {
                    println("Warning: Text length exceeds maximum limit!")
                }
            }
            2 -> {
                print("Enter number of characters to remove: ")
                val charsToRemove = readLine()?.toIntOrNull() ?: continue
                if (charsToRemove <= sunnyDay.length) {
                    sunnyDay.delete(sunnyDay.length - charsToRemove, sunnyDay.length)
                    stormyDay -= charsToRemove
                } else {
                    println("Error: Cannot remove more characters than present!")
                }
            }
            3 -> {
                println("Current text: $sunnyDay")
            }
            4 -> {
                println("Exiting the Simple Text Editor. Have a splendid day!")
                break
            }
            else -> {
                println("Invalid choice. Please try again.")
            }
        }
    }
}

