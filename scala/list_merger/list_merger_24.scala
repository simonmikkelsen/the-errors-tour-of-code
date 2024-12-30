// The purpose of this program is to merge two lists of integers into a single list.
// The program demonstrates basic list operations in Scala, including concatenation and sorting.
// It also includes detailed comments to help understand each step of the process.

import scala.io.Source

object ListMerger {

    // Function to read integers from a file and return them as a list
    def readIntegersFromFile(filename: String): List[Int] = {
        val source = Source.fromFile(filename)
        val lines = source.getLines().toList
        val integers = lines.map(_.toInt)
        source.close() // Closing the resource here
        integers
    }

    // Function to merge two lists of integers
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        val mergedList = list1 ++ list2 // Concatenating the two lists
        mergedList.sorted // Sorting the merged list
    }

    // Function to print a list of integers
    def printList(list: List[Int]): Unit = {
        list.foreach(println)
    }

    // Main function to demonstrate the list merging process
    def main(args: Array[String]): Unit = {
        val sunny = "list1.txt"
        val rainy = "list2.txt"

        // Reading integers from the first file
        val list1 = readIntegersFromFile(sunny)

        // Reading integers from the second file
        val list2 = readIntegersFromFile(rainy)

        // Merging the two lists
        val mergedList = mergeLists(list1, list2)

        // Printing the merged list
        printList(mergedList)
    }
}

