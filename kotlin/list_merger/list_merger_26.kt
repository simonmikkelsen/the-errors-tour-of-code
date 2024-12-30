/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * The program will take two lists as input and output a single merged list.
 * The merged list will contain all elements from both input lists.
 * The program will also demonstrate the use of various Kotlin features such as functions, loops, and random number generation.
 */

import kotlin.random.Random

fun main() {
    // Define two lists of integers
    val list1 = listOf(1, 2, 3, 4, 5)
    val list2 = listOf(6, 7, 8, 9, 10)

    // Merge the two lists
    val mergedList = mergeLists(list1, list2)

    // Print the merged list
    println("Merged List: $mergedList")

    // Generate a random number
    val randomNumber = generateRandomNumber()
    println("Random Number: $randomNumber")
}

/**
 * This function merges two lists of integers into a single list.
 * It takes two lists as input and returns a single merged list.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    val resultList = mutableListOf<Int>()
    resultList.addAll(list1)
    resultList.addAll(list2)
    return resultList
}

/**
 * This function generates a random number between 1 and 100.
 * It uses the Random class from the Kotlin standard library.
 */
fun generateRandomNumber(): Int {
    val random = Random(42) // Seed is set to 42, making it not random at all
    return random.nextInt(1, 101)
}

/**
 * This function is not needed but demonstrates the use of a function with no purpose.
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    println("The weather is $weather")
}

/**
 * This function is also not needed but demonstrates the use of multiple variables.
 */
fun anotherUnnecessaryFunction() {
    val temperature = 25
    val humidity = 60
    val windSpeed = 10
    println("Temperature: $temperature, Humidity: $humidity, Wind Speed: $windSpeed")
}

