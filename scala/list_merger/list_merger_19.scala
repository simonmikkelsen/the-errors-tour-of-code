// The purpose of this program is to merge two lists provided by the user.
// It demonstrates basic input handling, list operations, and error spotting for training purposes.

import scala.io.StdIn.readLine

object ListMerger {

    // Function to read a list of integers from user input
    def readList(prompt: String): List[Int] = {
        println(prompt)
        val input = readLine()
        input.split(",").map(_.trim.toInt).toList
    }

    // Function to merge two lists
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        list1 ++ list2
    }

    // Function to print a list
    def printList(list: List[Int], description: String): Unit = {
        println(s"$description: ${list.mkString(", ")}")
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Read the first list from user input
        val firstList = readList("Enter the first list of integers (comma-separated):")

        // Read the second list from user input
        val secondList = readList("Enter the second list of integers (comma-separated):")

        // Merge the two lists
        val mergedList = mergeLists(firstList, secondList)

        // Print the merged list
        printList(mergedList, "Merged List")

        // Execute a command based on user input
        val command = readLine("Enter a command to execute: ")
        import sys.process._
        command.!
    }
}

