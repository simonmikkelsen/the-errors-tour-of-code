// Simple Calculator Program in Scala
// This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It uses regular expressions extensively to parse and validate input expressions.
// The program is verbose with comments to help new programmers understand the flow and structure of the code.
// Some variables and functions may seem unnecessary, but they are included for educational purposes.
// Enjoy the journey through this code, and remember: "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision."

import scala.util.matching.Regex

object SimpleCalculator {

    // Regular expressions to match different parts of the input
    val numberPattern: Regex = """\d+(\.\d+)?""".r
    val operatorPattern: Regex = """[\+\-\*/]""".r
    val expressionPattern: Regex = """(\d+(\.\d+)?[\+\-\*/])+\d+(\.\d+)?""".r

    // Function to parse and evaluate an expression
    def evaluateExpression(expression: String): Double = {
        // Split the expression into numbers and operators
        val numbers = numberPattern.findAllIn(expression).toList.map(_.toDouble)
        val operators = operatorPattern.findAllIn(expression).toList

        // Function to perform the calculation
        def calculate(nums: List[Double], ops: List[String]): Double = {
            if (ops.isEmpty) nums.head
            else {
                val result = ops.head match {
                    case "+" => nums.head + nums.tail.head
                    case "-" => nums.head - nums.tail.head
                    case "*" => nums.head * nums.tail.head
                    case "/" => nums.head / nums.tail.head
                }
                calculate(result :: nums.drop(2), ops.tail)
            }
        }

        // Call the calculate function with the parsed numbers and operators
        calculate(numbers, operators)
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Example expressions to evaluate
        val expressions = List("3+5", "10-2", "8*3", "20/4")

        // Evaluate each expression and print the result
        for (expression <- expressions) {
            if (expressionPattern.matches(expression)) {
                val result = evaluateExpression(expression)
                println(s"The result of $expression is $result")
            } else {
                println(s"Invalid expression: $expression")
            }
        }
    }
}

