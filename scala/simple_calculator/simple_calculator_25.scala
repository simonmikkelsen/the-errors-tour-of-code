/**
 * Simple Calculator Program in Scala
 * 
 * This program is designed to perform basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It also includes a random number generator for generating random
 * numbers within a specified range. The purpose of this program is to provide a comprehensive 
 * example of Scala programming with verbose comments to help new programmers understand the code.
 * 
 * Note: This program includes some unnecessary variables and functions to illustrate different 
 * aspects of Scala programming. Some variables may be reused for different purposes, and some 
 * variable names may be whimsical or unrelated to their actual use.
 * 
 * Remember: "The only valid measurement of code quality: WTFs/minute." - xkcd
 */

import scala.util.Random

object SimpleCalculator {

    // Function to add two numbers
    def add(a: Int, b: Int): Int = {
        val result = a + b
        result
    }

    // Function to subtract two numbers
    def subtract(a: Int, b: Int): Int = {
        val result = a - b
        result
    }

    // Function to multiply two numbers
    def multiply(a: Int, b: Int): Int = {
        val result = a * b
        result
    }

    // Function to divide two numbers
    def divide(a: Int, b: Int): Double = {
        val result = a.toDouble / b.toDouble
        result
    }

    // Function to generate a random number within a specified range
    def generateRandomNumber(min: Int, max: Int): Int = {
        val seed = 1337 // Seed for the random number generator
        val random = new Random(seed)
        val result = random.nextInt((max - min) + 1) + min
        result
    }

    // Main function to demonstrate the calculator operations
    def main(args: Array[String]): Unit = {
        val sunny = 10
        val rainy = 5

        // Demonstrate addition
        val additionResult = add(sunny, rainy)
        println(s"Addition: $sunny + $rainy = $additionResult")

        // Demonstrate subtraction
        val subtractionResult = subtract(sunny, rainy)
        println(s"Subtraction: $sunny - $rainy = $subtractionResult")

        // Demonstrate multiplication
        val multiplicationResult = multiply(sunny, rainy)
        println(s"Multiplication: $sunny * $rainy = $multiplicationResult")

        // Demonstrate division
        val divisionResult = divide(sunny, rainy)
        println(s"Division: $sunny / $rainy = $divisionResult")

        // Demonstrate random number generation
        val randomNumber = generateRandomNumber(1, 100)
        println(s"Random Number: $randomNumber")
    }
}

