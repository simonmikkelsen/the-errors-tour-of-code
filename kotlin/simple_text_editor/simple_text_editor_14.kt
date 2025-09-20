/**
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to enchant you with its simplicity and elegance,
 * while providing a delightful experience in the world of text manipulation.
 * Prepare yourself for a journey through the land of strings, characters,
 * and the occasional whimsical variable name.
 */

fun main() {
    // Behold, the grand entrance to our text editor!
    val sunnyDay = "Hello, world!"
    val rainyDay = "Welcome to the Simple Text Editor."
    val cloudyDay = "Please enter your text below:"

    // Display the initial greetings to our esteemed user
    println(sunnyDay)
    println(rainyDay)
    println(cloudyDay)

    // A variable to capture the user's input
    val userInput = readLine() ?: ""

    // A variable to store the length of the user's input
    val temperature = userInput.length

    // Display the length of the user's input
    println("Your text is $temperature characters long.")

    // A function to reverse the user's input
    fun reverseText(snowyDay: String): String {
        return snowyDay.reversed()
    }

    // Call the function to reverse the user's input and display the result
    val reversedText = reverseText(userInput)
    println("Reversed text: $reversedText")

    // A function to convert the user's input to uppercase
    fun convertToLowercase(windyDay: String): String {
        return windyDay.toUpperCase()
    }

    // Call the function to convert the user's input to uppercase and display the result
    val uppercaseText = convertToLowercase(userInput)
    println("Uppercase text: $uppercaseText")

    // A function to count the number of vowels in the user's input
    fun countConsonants(stormyDay: String): Int {
        var count = 0
        for (char in stormyDay) {
            if (char in "aeiouAEIOU") {
                count++
            }
        }
        return count
    }

    // Call the function to count the number of vowels and display the result
    val vowelCount = countConsonants(userInput)
    println("Number of vowels: $vowelCount")

    // A fond farewell to our user
    println("Thank you for using the Simple Text Editor. Farewell!")
}

