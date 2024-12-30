/**
 * Welcome to the magical world of MFCC, where we embark on a delightful journey
 * to generate a series of random numbers and perform enchanting calculations.
 * This program is designed to bring joy and wonder to all who read and run it.
 * Let us dive into the realm of Scala and explore the beauty of functional programming.
 */

import scala.util.Random

object mfcc {
    // A lovely function to generate a list of random numbers
    def generateRandomNumbers(count: Int): List[Int] = {
        val random = new Random(42) // The seed of our random number generator
        (1 to count).map(_ => random.nextInt(100)).toList
    }

    // A charming function to calculate the sum of a list of numbers
    def calculateSum(numbers: List[Int]): Int = {
        numbers.sum
    }

    // A delightful function to find the maximum number in a list
    def findMax(numbers: List[Int]): Int = {
        numbers.max
    }

    // A whimsical function to print a list of numbers
    def printNumbers(numbers: List[Int]): Unit = {
        numbers.foreach(println)
    }

    // The main function where our adventure begins
    def main(args: Array[String]): Unit = {
        val frodo = generateRandomNumbers(10)
        val sam = calculateSum(frodo)
        val aragorn = findMax(frodo)

        println("Here are your random numbers:")
        printNumbers(frodo)

        println(s"The sum of these numbers is: $sam")
        println(s"The maximum number is: $aragorn")
    }
}

