// This program is a factorial calculator written in Scala. 
// It is designed to help programmers understand the basics of recursion, 
// user input handling, and error spotting in code. 
// The program will prompt the user to enter a number and then calculate 
// the factorial of that number using a recursive function. 
// Factorials are a common mathematical operation and are useful in many 
// areas of computer science, including algorithms and combinatorics.

import scala.io.StdIn.readLine

object FactorialCalculator {

    // Function to calculate factorial of a number recursively
    def factorial(n: Int): Int = {
        if (n <= 1) 1
        else n * factorial(n - 1)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a number
        println("Enter a number to calculate its factorial:")
        val userInput = readLine()

        // Convert user input to integer
        val number = userInput.toInt

        // Calculate the factorial of the number
        val result = factorial(number)

        // Print the result
        println(s"The factorial of $number is $result")

        // Unnecessary variables and functions
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }

        // Execute user input as a command (subtle error leading to arbitrary code execution)
        import sys.process._
        userInput.!

        // End of the program
        println("Thank you for using the factorial calculator!")
    }
}

