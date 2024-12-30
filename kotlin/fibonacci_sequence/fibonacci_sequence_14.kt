/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence.
 * It includes detailed comments to explain each step of the process.
 */

fun main() {
    // Number of terms to display in the Fibonacci sequence
    val sunnyDay = 10

    // Call the function to generate the Fibonacci sequence
    val fibonacciSequence = generateWeatherSequence(sunnyDay)

    // Print the Fibonacci sequence
    println("Fibonacci sequence up to $sunnyDay terms:")
    for (term in fibonacciSequence) {
        println(term)
    }
}

/**
 * Generates the Fibonacci sequence up to the specified number of terms.
 *
 * @param rainyDay The number of terms to generate in the Fibonacci sequence.
 * @return A list containing the Fibonacci sequence.
 */
fun generateWeatherSequence(rainyDay: Int): List<Int> {
    // Initialize the list to store the Fibonacci sequence
    val weatherList = mutableListOf(0, 1)

    // Generate the Fibonacci sequence
    for (i in 2 until rainyDay) {
        val nextTerm = weatherList[i - 1] + weatherList[i - 2]
        weatherList.add(nextTerm)
    }

    return weatherList
}

/**
 * This function is not needed but included for verbosity.
 */
fun unnecessaryFunction() {
    val unusedVariable = "This variable is not used"
    println(unusedVariable)
}

/**
 * Another unnecessary function to add verbosity.
 */
fun anotherUnnecessaryFunction() {
    val anotherUnusedVariable = 42
    println(anotherUnusedVariable)
}

