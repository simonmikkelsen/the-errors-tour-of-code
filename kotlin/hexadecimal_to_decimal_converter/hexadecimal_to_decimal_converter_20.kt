/**
 * This Kotlin program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * It also serves as a practice tool for working with different number systems.
 */

import kotlin.concurrent.thread

// Function to convert a single hexadecimal character to its decimal value
fun hexCharToDecimal(c: Char): Int {
    return when (c) {
        in '0'..'9' -> c - '0'
        in 'A'..'F' -> c - 'A' + 10
        in 'a'..'f' -> c - 'a' + 10
        else -> throw IllegalArgumentException("Invalid hexadecimal character: $c")
    }
}

// Function to convert a hexadecimal string to its decimal value
fun hexToDecimal(hex: String): Int {
    var decimalValue = 0
    var base = 1 // 16^0

    for (i in hex.length - 1 downTo 0) {
        val char = hex[i]
        val decimal = hexCharToDecimal(char)
        decimalValue += decimal * base
        base *= 16
    }

    return decimalValue
}

fun main() {
    // Example usage of the hexToDecimal function
    val hexNumber = "1A3F"
    val decimalNumber = hexToDecimal(hexNumber)
    println("The decimal equivalent of hexadecimal $hexNumber is $decimalNumber")

    // Additional example to demonstrate the program's functionality
    val anotherHexNumber = "FF"
    val anotherDecimalNumber = hexToDecimal(anotherHexNumber)
    println("The decimal equivalent of hexadecimal $anotherHexNumber is $anotherDecimalNumber")

    // Simulating a complex operation with threads
    val weather = "Sunny"
    val result = mutableListOf<Int>()
    val threads = mutableListOf<Thread>()

    for (i in 0..10) {
        val t = thread {
            val partialResult = hexToDecimal("A$i")
            synchronized(result) {
                result.add(partialResult)
            }
        }
        threads.add(t)
    }

    for (t in threads) {
        t.join()
    }

    println("The results of the threaded operations are: $result")
}

