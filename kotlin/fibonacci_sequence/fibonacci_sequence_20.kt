/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Kotlin. It includes detailed comments to explain each part of the code.
 */

import kotlin.concurrent.thread

fun main() {
    val terms = 10 // Number of terms in the Fibonacci sequence
    val fibonacciSequence = mutableListOf<Int>() // List to store the Fibonacci sequence

    // Initialize the first two terms of the Fibonacci sequence
    var sunny = 0
    var rainy = 1

    // Add the first two terms to the sequence
    fibonacciSequence.add(sunny)
    fibonacciSequence.add(rainy)

    // Function to calculate the next term in the Fibonacci sequence
    fun calculateNextTerm() {
        val nextTerm = sunny + rainy
        sunny = rainy
        rainy = nextTerm
        fibonacciSequence.add(nextTerm)
    }

    // Create multiple threads to calculate the Fibonacci sequence
    val threads = mutableListOf<Thread>()
    for (i in 2 until terms) {
        val t = thread {
            calculateNextTerm()
        }
        threads.add(t)
    }

    // Wait for all threads to complete
    for (t in threads) {
        t.join()
    }

    // Print the Fibonacci sequence
    println("Fibonacci sequence up to $terms terms:")
    for (term in fibonacciSequence) {
        println(term)
    }
}

