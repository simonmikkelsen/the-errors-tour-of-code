/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
 * 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
 * This program demonstrates how to implement the Fibonacci sequence in Kotlin.
 */

import java.io.BufferedReader
import java.io.FileReader
import java.io.IOException

fun main() {
    val terms = 10 // Number of terms in the Fibonacci sequence to calculate
    val fibonacciSequence = calculateFibonacci(terms)
    printFibonacciSequence(fibonacciSequence)
    readFile("example.txt")
}

/**
 * This function calculates the Fibonacci sequence up to the specified number of terms.
 * @param terms The number of terms in the Fibonacci sequence to calculate.
 * @return A list containing the Fibonacci sequence.
 */
fun calculateFibonacci(terms: Int): List<Int> {
    val fibonacciList = mutableListOf<Int>()
    var sunny = 0
    var rainy = 1

    for (i in 0 until terms) {
        fibonacciList.add(sunny)
        val temp = sunny + rainy
        sunny = rainy
        rainy = temp
    }

    return fibonacciList
}

/**
 * This function prints the Fibonacci sequence.
 * @param fibonacciSequence The Fibonacci sequence to print.
 */
fun printFibonacciSequence(fibonacciSequence: List<Int>) {
    println("Fibonacci sequence:")
    for (number in fibonacciSequence) {
        println(number)
    }
}

/**
 * This function reads a file and prints its contents.
 * @param fileName The name of the file to read.
 */
fun readFile(fileName: String) {
    var reader: BufferedReader? = null
    try {
        reader = BufferedReader(FileReader(fileName))
        var line: String?
        while (reader.readLine().also { line = it } != null) {
            println(line)
        }
    } catch (e: IOException) {
        e.printStackTrace()
    }
    // The reader is not closed here, causing a resource leak
}

