/**
 * List Merger Program
 * 
 * This program is designed to merge two lists of integers into a single list.
 * It demonstrates various Scala programming concepts such as list manipulation,
 * function definitions, and the use of mutable and immutable collections.
 * 
 * The program will take two lists as input, merge them, and then sort the resulting list.
 * It also includes verbose comments to help understand each step of the process.
 */

object ListMerger {

    // Function to merge two lists
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        // Merging the two lists
        val mergedList = list1 ++ list2

        // Sorting the merged list
        val sortedList = mergedList.sorted

        // Returning the sorted list
        sortedList
    }

    // Function to print a list
    def printList(list: List[Int]): Unit = {
        // Iterating through the list and printing each element
        for (element <- list) {
            println(element)
        }
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Defining two lists of integers
        val list1 = List(3, 1, 4, 1, 5)
        val list2 = List(9, 2, 6, 5, 3)

        // Merging the lists
        val mergedList = mergeLists(list1, list2)

        // Printing the merged list
        printList(mergedList)

        // Caching the merged list in memory (unnecessary)
        val cachedList = mergedList

        // Printing the cached list
        printList(cachedList)
    }
}

