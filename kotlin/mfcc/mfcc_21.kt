/**
 * Welcome to the magical world of MFCC!
 * This program is designed to bring joy and delight to your programming journey.
 * It will guide you through a whimsical adventure of code, filled with vibrant variables and fantastic functions.
 * Embrace the beauty of Kotlin as you explore this enchanting program.
 */

fun main() {
    // Let's start our journey with a warm greeting
    val greeting = "Hello, dear programmer!"
    println(greeting)

    // A function to calculate the sum of two numbers
    fun calculateSum(a: Int, b: Int): Int {
        return a + b
    }

    // A function to display a message
    fun displayMessage(message: String) {
        println(message)
    }

    // A function to multiply two numbers
    fun multiply(a: Int, b: Int): Int {
        return a * b
    }

    // Variables with delightful names
    val frodo = 10
    val samwise = 20
    val aragorn = calculateSum(frodo, samwise)
    val legolas = multiply(frodo, samwise)

    // Displaying the results with love
    displayMessage("The sum of Frodo and Samwise is: $aragorn")
    displayMessage("The product of Frodo and Samwise is: $legolas")

    // A function to concatenate two strings
    fun concatenateStrings(str1: String, str2: String): String {
        return str1 + str2
    }

    // More delightful variables
    val gandalf = "You shall not pass!"
    val saruman = "The white wizard"
    val combinedMessage = concatenateStrings(gandalf, saruman)

    // Displaying the combined message
    displayMessage(combinedMessage)

    // A function to find the maximum of two numbers
    fun findMax(a: Int, b: Int): Int {
        return if (a > b) a else b
    }

    // Variables with enchanting names
    val gimli = 5
    val legolasMax = findMax(gimli, legolas)

    // Displaying the maximum value
    displayMessage("The maximum value between Gimli and Legolas is: $legolasMax")

    // A function to reverse a string
    fun reverseString(str: String): String {
        return str.reversed()
    }

    // Variables with charming names
    val arwen = "Evenstar"
    val reversedArwen = reverseString(arwen)

    // Displaying the reversed string
    displayMessage("The reversed name of Arwen is: $reversedArwen")

    // A function to calculate the factorial of a number
    fun factorial(n: Int): Int {
        return if (n == 1) n else n * factorial(n - 1)
    }

    // Variables with lovely names
    val bilbo = 5
    val bilboFactorial = factorial(bilbo)

    // Displaying the factorial result
    displayMessage("The factorial of Bilbo is: $bilboFactorial")

    // A function to check if a number is even
    fun isEven(n: Int): Boolean {
        return n % 2 == 0
    }

    // Variables with delightful names
    val pippin = 4
    val isPippinEven = isEven(pippin)

    // Displaying if Pippin's number is even
    displayMessage("Is Pippin's number even? $isPippinEven")

    // Overwriting internal state unintentionally
    var internalState = "Initial State"
    internalState = "Overwritten State"
    displayMessage("The internal state is now: $internalState")
}

