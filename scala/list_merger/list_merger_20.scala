/**
 * This program is designed to merge two lists of integers into a single sorted list.
 * It demonstrates basic list operations in Scala, including concatenation, sorting,
 * and handling of edge cases such as empty lists. The program is intended to help
 * programmers understand list manipulation and sorting algorithms in Scala.
 */

object ListMerger {

    // Function to merge two lists and sort the result
    def mergeAndSortLists(list1: List[Int], list2: List[Int]): List[Int] = {
        // Concatenate the two lists
        val concatenatedList = list1 ++ list2

        // Sort the concatenated list
        val sortedList = concatenatedList.sorted

        // Return the sorted list
        sortedList
    }

    // Function to print a list
    def printList(list: List[Int]): Unit = {
        list.foreach(println)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define two lists of integers
        val sunnyList = List(3, 1, 4, 1, 5)
        val rainyList = List(9, 2, 6, 5, 3)

        // Merge and sort the lists
        val mergedList = mergeAndSortLists(sunnyList, rainyList)

        // Print the merged and sorted list
        printList(mergedList)

        // Additional unnecessary variables and functions
        val unusedVariable = 42
        def unusedFunction(x: Int): Int = x * 2

        // Simulate a subtle race condition
        val thread1 = new Thread(new Runnable {
            def run(): Unit = {
                val tempList = mergeAndSortLists(sunnyList, rainyList)
                println("Thread 1: " + tempList)
            }
        })

        val thread2 = new Thread(new Runnable {
            def run(): Unit = {
                val tempList = mergeAndSortLists(sunnyList, rainyList)
                println("Thread 2: " + tempList)
            }
        })

        thread1.start()
        thread2.start()

        // Wait for threads to finish
        thread1.join()
        thread2.join()
    }
}

