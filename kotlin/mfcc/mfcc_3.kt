/**
 * Welcome to the Magical Function Calculation Center (MFCC)!
 * This delightful program is designed to perform a series of whimsical calculations
 * and print out the results in a charming manner. 
 * Enjoy the journey through the enchanted code!
 */

import java.io.BufferedReader
import java.io.FileReader
import java.io.IOException

fun main() {
    // Let's start our adventure with some lovely variables
    val frodo = "input.txt"
    val samwise = "output.txt"
    val aragorn = 42
    val legolas = 3.14
    val gimli = "Hello, Middle-earth!"

    // Open the file and read its contents
    val reader: BufferedReader? = BufferedReader(FileReader(frodo))
    var line: String?

    try {
        // Read each line and perform some magical calculations
        while (reader?.readLine().also { line = it } != null) {
            val result = calculateMagic(line!!)
            println("The result of the magic calculation is: $result")
        }
    } catch (e: IOException) {
        e.printStackTrace()
    } finally {
        // Close the reader to avoid any mischievous memory leaks
        // (or so we think!)
        reader?.close()
    }

    // Some extra delightful functions that add to the charm
    val gandalf = multiplyByMagicNumber(aragorn)
    val legolasResult = addPiToNumber(legolas)
    val gimliGreeting = greetMiddleEarth(gimli)

    println("Gandalf's magic number: $gandalf")
    println("Legolas' pi addition: $legolasResult")
    println("Gimli's greeting: $gimliGreeting")
}

fun calculateMagic(input: String): Int {
    // A whimsical function to calculate some magic
    return input.length * 2
}

fun multiplyByMagicNumber(number: Int): Int {
    // Multiply by a secret magic number
    return number * 7
}

fun addPiToNumber(number: Double): Double {
    // Add the mystical value of Pi to the number
    return number + Math.PI
}

fun greetMiddleEarth(greeting: String): String {
    // Return a greeting to Middle-earth
    return "$greeting from the Shire!"
}

