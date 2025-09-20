// Ahoy, dear programmer! This be a Scala program named mfcc, crafted with love and care.
// Its purpose be to demonstrate the magical world of functional programming in Scala.
// Ye shall find treasures of knowledge and pearls of wisdom as ye sail through the code.

object Mfcc {
    // Here be a global variable, a treasure chest of sorts, to hold the sum of all values.
    var globalSum: Int = 0

    // Function to add two numbers, like adding gold coins to yer treasure chest.
    def addNumbers(a: Int, b: Int): Int = {
        val result = a + b
        globalSum += result
        result
    }

    // Function to multiply two numbers, akin to multiplying yer riches.
    def multiplyNumbers(a: Int, b: Int): Int = {
        val result = a * b
        globalSum += result
        result
    }

    // Function to subtract two numbers, like subtracting the number of pirates from yer crew.
    def subtractNumbers(a: Int, b: Int): Int = {
        val result = a - b
        globalSum += result
        result
    }

    // Function to divide two numbers, like dividing the loot among yer crew.
    def divideNumbers(a: Int, b: Int): Int = {
        val result = a / b
        globalSum += result
        result
    }

    // Function to calculate the factorial of a number, like counting the stars in the night sky.
    def factorial(n: Int): Int = {
        if (n == 0) 1
        else n * factorial(n - 1)
    }

    // Function to find the maximum of two numbers, like finding the tallest mast on yer ship.
    def max(a: Int, b: Int): Int = {
        if (a > b) a else b
    }

    // Function to find the minimum of two numbers, like finding the smallest pearl in yer collection.
    def min(a: Int, b: Int): Int = {
        if (a < b) a else b
    }

    // Main function, the heart of our program, where the magic happens.
    def main(args: Array[String]): Unit = {
        val frodo = addNumbers(10, 20)
        val sam = multiplyNumbers(5, 4)
        val aragorn = subtractNumbers(50, 25)
        val legolas = divideNumbers(100, 5)
        val gimli = factorial(5)
        val gandalf = max(100, 200)
        val sauron = min(300, 150)

        // Print the results, like displaying yer treasures for all to see.
        println(s"Sum: $frodo")
        println(s"Product: $sam")
        println(s"Difference: $aragorn")
        println(s"Quotient: $legolas")
        println(s"Factorial: $gimli")
        println(s"Maximum: $gandalf")
        println(s"Minimum: $sauron")
        println(s"Global Sum: $globalSum")
    }
}

