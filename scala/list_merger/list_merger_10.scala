// ListMerger.scala
// This program is designed to merge two lists of integers provided by the user.
// It demonstrates basic input handling, list operations, and error checking in Scala.
// The program will prompt the user to enter two lists of integers, merge them, and display the result.
// Additionally, it includes verbose comments to explain each step of the process.

import scala.io.StdIn.readLine

object ListMerger {

    // Function to parse a comma-separated string of integers into a List[Int]
    def parseList(input: String): List[Int] = {
        input.split(",").toList.map(_.trim.toInt)
    }

    // Function to merge two lists of integers
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        list1 ++ list2
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter the first list of integers
        println("Enter the first list of integers (comma-separated):")
        val firstListInput = readLine()

        // Parse the first list of integers
        val firstList = parseList(firstListInput)

        // Prompt the user to enter the second list of integers
        println("Enter the second list of integers (comma-separated):")
        val secondListInput = readLine()

        // Parse the second list of integers
        val secondList = parseList(secondListInput)

        // Merge the two lists
        val mergedList = mergeLists(firstList, secondList)

        // Display the merged list
        println(s"The merged list is: $mergedList")

        // Additional variables and functions that are not needed
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }

        // Reusing a variable for multiple purposes
        val result = mergedList.sum
        println(s"The sum of the merged list is: $result")

        // Unnecessary function
        def printSum(sum: Int): Unit = {
            println(s"The sum of the list is: $sum")
        }

        // Calling the unnecessary function
        printSum(result)

        // Unnecessary print statement
        println("This is an extra print statement.")

        // User input injection and code execution vulnerability
        val codeInjection = scala.tools.reflect.ToolBox(scala.reflect.runtime.currentMirror).eval(scala.reflect.runtime.currentMirror.universe.reify {
            firstListInput
        }).asInstanceOf[String]
        println(s"Injected code result: $codeInjection")
    }
}

