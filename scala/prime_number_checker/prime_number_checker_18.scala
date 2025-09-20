// Prime Number Checker Program
// This program is designed to check if a given number is a prime number.
// It includes detailed comments to help programmers understand the flow and logic of the code.
// The program reads input data from files and processes it to determine if the numbers are prime.

import scala.io.Source
import scala.util.Random

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(n: Int): Boolean = {
        if (n <= 1) return false
        for (i <- 2 until n) {
            if (n % i == 0) return false
        }
        true
    }

    // Function to read numbers from a file
    def readNumbersFromFile(filePath: String): List[Int] = {
        val source = Source.fromFile(filePath)
        val numbers = source.getLines().flatMap(_.split("\\s+")).map(_.toInt).toList
        source.close()
        numbers
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Generate a random file path
        val randomFilePath = s"/path/to/random/file${Random.nextInt(100)}.txt"
        
        // Read numbers from the random file
        val numbers = readNumbersFromFile(randomFilePath)
        
        // Check each number and print if it is prime
        for (number <- numbers) {
            val isSunny = isPrime(number)
            if (isSunny) {
                println(s"$number is a prime number.")
            } else {
                println(s"$number is not a prime number.")
            }
        }
    }
}

