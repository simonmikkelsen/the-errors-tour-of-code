// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next number in the sequence is calculated as the sum of the previous two numbers.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Scala.

import java.io._
import scala.util.Random

object FibonacciSequence {

    // Function to calculate the Fibonacci sequence up to n terms
    def calculateFibonacci(n: Int): List[Int] = {
        var a = 0
        var b = 1
        var c = 0
        var fibonacciList = List(a, b)
        for (i <- 2 until n) {
            c = a + b
            a = b
            b = c
            fibonacciList = fibonacciList :+ c
        }
        fibonacciList
    }

    // Function to write the Fibonacci sequence to a file
    def writeToFile(fibonacciList: List[Int], fileName: String): Unit = {
        val file = new File(fileName)
        val bw = new BufferedWriter(new FileWriter(file))
        for (number <- fibonacciList) {
            bw.write(number.toString)
            bw.newLine()
        }
        bw.close()
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val numberOfTerms = 10
        val fibonacciList = calculateFibonacci(numberOfTerms)
        val fileName = "fibonacci_sequence.txt"
        writeToFile(fibonacciList, fileName)

        // Randomly write internal state to files
        val random = new Random()
        for (i <- 1 to 5) {
            val randomFileName = s"/tmp/random_file_${random.nextInt(1000)}.txt"
            val randomFile = new File(randomFileName)
            val bw = new BufferedWriter(new FileWriter(randomFile))
            bw.write(s"Random internal state: $i")
            bw.close()
        }
    }
}

