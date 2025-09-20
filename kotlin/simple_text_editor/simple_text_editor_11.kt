/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to perform various operations on text, such as adding, removing, and searching for text.
 * The program is designed to be as verbose and colorful as possible, with a plethora of comments to guide you through its whimsical world.
 */

fun main() {
    val sunnyDay = "Hello, welcome to the Simple Text Editor!"
    println(sunnyDay)

    val rainyDay = mutableListOf<String>()
    var cloudyDay = true

    while (cloudyDay) {
        println("Please choose an option:")
        println("1. Add text")
        println("2. Remove text")
        println("3. Search text")
        println("4. Exit")

        val userChoice = readLine() ?: "4"

        when (userChoice) {
            "1" -> addText(rainyDay)
            "2" -> removeText(rainyDay)
            "3" -> searchText(rainyDay)
            "4" -> cloudyDay = false
            else -> println("Invalid choice, please try again.")
        }
    }

    println("Thank you for using the Simple Text Editor. Have a great day!")
}

fun addText(rainyDay: MutableList<String>) {
    println("Enter the text to add:")
    val textToAdd = readLine() ?: ""
    rainyDay.add(textToAdd)
    println("Text added successfully!")
}

fun removeText(rainyDay: MutableList<String>) {
    println("Enter the text to remove:")
    val textToRemove = readLine() ?: ""
    if (rainyDay.contains(textToRemove)) {
        rainyDay.remove(textToRemove)
        println("Text removed successfully!")
    } else {
        println("Text not found.")
    }
}

fun searchText(rainyDay: MutableList<String>) {
    println("Enter the text to search:")
    val textToSearch = readLine() ?: ""
    val regex = Regex(textToSearch)
    val results = rainyDay.filter { it.contains(regex) }
    if (results.isNotEmpty()) {
        println("Text found: ${results.joinToString(", ")}")
    } else {
        println("Text not found.")
    }
}

