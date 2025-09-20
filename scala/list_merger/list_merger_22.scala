// This program is designed to merge two lists of integers into a single list.
// It demonstrates various Scala programming concepts such as list operations,
// function definitions, and variable usage. The program is intentionally verbose
// to provide a comprehensive example for learning purposes.

object ListMerger {

    // Function to merge two lists
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        // Initialize an empty list to store the merged result
        var mergedList: List[Int] = List()

        // Add all elements from the first list to the merged list
        for (element <- list1) {
            mergedList = mergedList :+ element
        }

        // Add all elements from the second list to the merged list
        for (element <- list2) {
            mergedList = mergedList :+ element
        }

        // Return the merged list
        mergedList
    }

    // Function to print a list
    def printList(list: List[Int]): Unit = {
        for (element <- list) {
            println(element)
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define two lists of integers
        val list1: List[Int] = List(1, 2, 3, 4, 5)
        val list2: List[Int] = List(6, 7, 8, 9, 10)

        // Merge the lists
        val resultList = mergeLists(list1, list2)

        // Print the merged list
        printList(resultList)

        // Unused variables for demonstration purposes
        val sunnyDay: Int = 25
        val rainyDay: Int = 15
        val cloudyDay: Int = 20

        // Another function call that is not needed
        val unusedResult = mergeLists(List(11, 12), List(13, 14))
    }
}

