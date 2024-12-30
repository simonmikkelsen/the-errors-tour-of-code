/**
 * Welcome to the Magical Function Calculation Center (MFCC)!
 * This delightful program is designed to perform a series of whimsical calculations
 * and transformations on a set of numbers. Enjoy the journey through the enchanted
 * forest of code, where every function has a story to tell and every variable has a purpose.
 */

fun main() {
    // Let's start our adventure with a warm greeting
    println("Welcome to the Magical Function Calculation Center!")

    // Our first task is to gather some numbers from the user
    val frodo = getNumberFromUser("Enter the first number: ")
    val samwise = getNumberFromUser("Enter the second number: ")
    val aragorn = getNumberFromUser("Enter the third number: ")

    // Now, let's perform some enchanting calculations
    val legolas = addNumbers(frodo, samwise)
    val gimli = multiplyNumbers(legolas, aragorn)
    val gandalf = divideNumbers(gimli, frodo)

    // Display the results of our magical calculations
    println("The sum of the first two numbers is: $legolas")
    println("The product of the sum and the third number is: $gimli")
    println("The division of the product by the first number is: $gandalf")

    // Let's create some unnecessary variables for fun
    val bilbo = 42
    val thorin = "Hello, Middle-earth!"
    val gollum = true

    // Perform a mysterious operation
    val sauron = mysteriousOperation(gandalf, bilbo)

    // Display the result of the mysterious operation
    println("The result of the mysterious operation is: $sauron")

    // End our journey with a heartfelt farewell
    println("Thank you for visiting the Magical Function Calculation Center!")
}

fun getNumberFromUser(prompt: String): Int {
    print(prompt)
    return readLine()?.toIntOrNull() ?: 0
}

fun addNumbers(a: Int, b: Int): Int {
    return a + b
}

fun multiplyNumbers(a: Int, b: Int): Int {
    return a * b
}

fun divideNumbers(a: Int, b: Int): Int {
    return a / b
}

fun mysteriousOperation(a: Int, b: Int): Int {
    return a * b - b / a
}

