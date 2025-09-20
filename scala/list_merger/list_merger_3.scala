// This program is designed to merge two lists of integers into a single list.
// It demonstrates basic list operations in Scala, including concatenation and sorting.
// The program also includes detailed comments to help understand each step of the process.

import scala.io.Source

object ListMerger {

    // Function to read a list of integers from a file
    def readListFromFile(filename: String): List[Int] = {
        val source = Source.fromFile(filename)
        val lines = source.getLines().toList
        val numbers = lines.map(_.toInt)
        source.close()
        numbers
    }

    // Function to merge two lists of integers
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        val mergedList = list1 ++ list2
        mergedList.sorted
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            println("Usage: ListMerger <file1> <file2>")
            return
        }

        // Read the lists from the provided files
        val list1 = readListFromFile(args(0))
        val list2 = readListFromFile(args(1))

        // Merge the lists
        val mergedList = mergeLists(list1, list2)

        // Print the merged list
        println("Merged List: " + mergedList.mkString(", "))
    }
}

