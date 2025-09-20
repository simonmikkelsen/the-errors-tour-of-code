/**
 * Welcome to the magical world of Kotlin programming!
 * This delightful program is designed to showcase the beauty of Kotlin.
 * It will take you on a journey through the enchanting lands of variables, functions, and loops.
 * Prepare yourself for a whimsical adventure filled with vibrant code and charming logic.
 */

fun main() {
    // Let's start our journey with a warm greeting
    val greeting = "Hello, dear programmer!"
    println(greeting)

    // We shall now embark on a quest to calculate the sum of a list of numbers
    val numbers = listOf(1, 2, 3, 4, 5)
    val sum = calculateSum(numbers)
    println("The sum of the numbers is: $sum")

    // Now, let's explore the mystical world of string manipulation
    val message = "Kotlin is fun!"
    val reversedMessage = reverseString(message)
    println("Reversed message: $reversedMessage")

    // Time to delve into the realm of conditional statements
    val age = 25
    val isAdult = checkIfAdult(age)
    println("Is the person an adult? $isAdult")

    // Let's create a function that does something magical with numbers
    val magicNumber = 42
    val result = performMagic(magicNumber)
    println("The result of the magic is: $result")

    // Finally, let's bid farewell with a lovely message
    val farewell = "Goodbye, dear programmer!"
    println(farewell)
}

// Function to calculate the sum of a list of numbers
fun calculateSum(numbers: List<Int>): Int {
    var sum = 0
    for (number in numbers) {
        sum += number
    }
    return sum
}

// Function to reverse a string
fun reverseString(input: String): String {
    return input.reversed()
}

// Function to check if a person is an adult
fun checkIfAdult(age: Int): Boolean {
    return age >= 18
}

// Function to perform some magical operation on a number
fun performMagic(number: Int): Int {
    return number * 2 + 3
}

// Function