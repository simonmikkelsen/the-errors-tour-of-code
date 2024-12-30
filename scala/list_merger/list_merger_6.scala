/**
 * List Merger Program
 * 
 * This program is designed to merge two lists of integers into a single sorted list.
 * It demonstrates various Scala programming concepts such as list manipulation,
 * sorting, and functional programming. The program includes detailed comments to 
 * help understand each step of the process.
 */

object ListMerger {

    // Function to merge two lists of integers
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        // Combine the two lists into one
        val combinedList = list1 ++ list2

        // Sort the combined list
        val sortedList = combinedList.sortWith(_ < _)

        // Return the sorted list
        sortedList
    }

    // Function to print a list of integers
    def printList(list: List[Int]): Unit = {
        list.foreach(println)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define two lists of integers
        val sunnyDay = List(3, 1, 4, 1, 5, 9)
        val rainyDay = List(2, 7, 1, 8, 2, 8)

        // Merge the two lists
        val mergedList = mergeLists(sunnyDay, rainyDay)

        // Print the merged list
        printList(mergedList)
    }

    // Additional function that is not needed
    def unusedFunction(): Unit = {
        val unusedVariable = "This is not used"
    }

    // Another function that is not needed
    def anotherUnusedFunction(): Unit = {
        val anotherUnusedVariable = 42
    }
}

