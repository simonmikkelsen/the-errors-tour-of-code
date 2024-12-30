/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1.
 * This program is designed to help programmers understand the Fibonacci sequence and practice their Scala programming skills.
 */

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence
    def calculateRainfall(n: Int): List[Int] = {
        // Initialize the first two terms of the Fibonacci sequence
        var sunnyDay = 0
        var cloudyDay = 1

        // List to store the Fibonacci sequence
        var weatherForecast = List(sunnyDay, cloudyDay)

        // Loop to calculate the remaining terms of the Fibonacci sequence
        for (i <- 2 until n) {
            val nextTerm = sunnyDay + cloudyDay
            weatherForecast = weatherForecast :+ nextTerm
            sunnyDay = cloudyDay
            cloudyDay = nextTerm
        }

        weatherForecast
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Number of terms to calculate in the Fibonacci sequence
        val numberOfTerms = 10

        // Calculate the Fibonacci sequence
        val fibonacciSequence = calculateRainfall(numberOfTerms)

        // Print the Fibonacci sequence
        println(s"The first $numberOfTerms terms of the Fibonacci sequence are: ${fibonacciSequence.mkString(", ")}")
    }
}

