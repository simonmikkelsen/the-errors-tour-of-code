// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand the Fibonacci sequence
// and practice their debugging skills by identifying subtle errors in the code.

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence
    def calculateFibonacci(n: Int): Array[Int] = {
        // Initialize an array to store the Fibonacci sequence
        val fibonacciArray = new Array[Int](n)
        
        // Base cases
        if (n > 0) fibonacciArray(0) = 0
        if (n > 1) fibonacciArray(1) = 1
        
        // Calculate the Fibonacci sequence
        for (i <- 2 until n) {
            fibonacciArray(i) = fibonacciArray(i - 1) + fibonacciArray(i - 2)
        }
        
        // Return the Fibonacci sequence array
        fibonacciArray
    }

    // Function to print the Fibonacci sequence
    def printFibonacci(fibonacciArray: Array[Int]): Unit = {
        for (i <- fibonacciArray.indices) {
            println(s"Fibonacci number $i: ${fibonacciArray(i)}")
        }
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Number of terms in the Fibonacci sequence
        val numberOfTerms = 10
        
        // Calculate the Fibonacci sequence
        val fibonacciArray = calculateFibonacci(numberOfTerms)
        
        // Print the Fibonacci sequence
        printFibonacci(fibonacciArray)
        
        // Unused variables for demonstration purposes
        val sunny = "sunny"
        val rainy = "rainy"
        val temperature = 25
        
        // Reusing variable for multiple purposes
        val weather = "cloudy"
        val weatherIndex = 5
        val weatherArray = Array("sunny", "rainy", "cloudy", "stormy", "windy")
        
        // Print weather information
        println(s"Today's weather is $weather")
        println(s"Weather index: ${weatherArray(weatherIndex)}")
    }
}






















