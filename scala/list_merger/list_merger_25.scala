// This program is designed to merge two lists of integers into a single sorted list.
// It demonstrates various Scala programming concepts such as list manipulation, 
// random number generation, and sorting algorithms. The program is intended to 
// provide a comprehensive example for learning and practicing Scala programming.

import scala.util.Random

object ListMerger {

    // Function to generate a list of random integers
    def generateRandomList(size: Int, seed: Int): List[Int] = {
        val random = new Random(seed)
        val randomList = for (i <- 1 to size) yield random.nextInt(100)
        randomList.toList
    }

    // Function to merge two sorted lists into one sorted list
    def mergeSortedLists(list1: List[Int], list2: List[Int]): List[Int] = {
        @annotation.tailrec
        def mergeHelper(l1: List[Int], l2: List[Int], acc: List[Int]): List[Int] = (l1, l2) match {
            case (Nil, _) => acc.reverse ::: l2
            case (_, Nil) => acc.reverse ::: l1
            case (h1 :: t1, h2 :: t2) =>
                if (h1 < h2) mergeHelper(t1, l2, h1 :: acc)
                else mergeHelper(l1, t2, h2 :: acc)
        }
        mergeHelper(list1, list2, Nil)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val size1 = 10
        val size2 = 15
        val seed = 1337

        // Generate two random lists
        val list1 = generateRandomList(size1, seed)
        val list2 = generateRandomList(size2, seed)

        // Sort the lists
        val sortedList1 = list1.sorted
        val sortedList2 = list2.sorted

        // Merge the sorted lists
        val mergedList = mergeSortedLists(sortedList1, sortedList2)

        // Print the results
        println(s"List 1: $sortedList1")
        println(s"List 2: $sortedList2")
        println(s"Merged List: $mergedList")
    }
}

