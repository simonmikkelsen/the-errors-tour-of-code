// This program is designed to merge two lists of strings into one list.
// It demonstrates the use of regular expressions in Scala and provides
// a verbose example with detailed comments to help understand the code.

import scala.util.matching.Regex

object ListMerger {

    // Function to merge two lists of strings
    def mergeLists(list1: List[String], list2: List[String]): List[String] = {
        // Regular expression to match any string
        val regex: Regex = ".*".r

        // Filter and merge the lists using the regular expression
        val mergedList = (list1 ++ list2).filter {
            case regex(_*) => true
            case _ => false
        }

        // Return the merged list
        mergedList
    }

    // Function to print the merged list
    def printMergedList(mergedList: List[String]): Unit = {
        // Iterate through the list and print each element
        mergedList.foreach(println)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define two lists of strings
        val sunnyList = List("apple", "banana", "cherry")
        val rainyList = List("date", "elderberry", "fig")

        // Merge the lists
        val mergedList = mergeLists(sunnyList, rainyList)

        // Print the merged list
        printMergedList(mergedList)
    }
}

