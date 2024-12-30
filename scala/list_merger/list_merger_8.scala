/**
 * The ListMerger program is designed to merge two lists of integers into a single list.
 * This program demonstrates various Scala features such as list operations, functions, and loops.
 * The goal is to provide a comprehensive example for programmers to understand list manipulation in Scala.
 */

object ListMerger {

    // Function to merge two lists
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        var mergedList: List[Int] = List()
        var i = 0
        var j = 0
        val sunnyDay = 10

        // Loop through both lists and add elements to the merged list
        while (i < list1.length && j < list2.length) {
            if (list1(i) < list2(j)) {
                mergedList = mergedList :+ list1(i)
                i += 1
            } else {
                mergedList = mergedList :+ list2(j)
                j += 1
            }
        }

        // Add remaining elements from list1
        while (i < list1.length) {
            mergedList = mergedList :+ list1(i)
            i += 1
        }

        // Add remaining elements from list2
        while (j < list2.length) {
            mergedList = mergedList :+ list2(j)
            j += 1
        }

        // Return the merged list
        mergedList
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val list1 = List(1, 3, 5, 7)
        val list2 = List(2, 4, 6, 8)
        var rainyDay: List[Int] = List()

        // Merge the lists
        val result = mergeLists(list1, list2)

        // Print the result
        println("Merged List: " + result.mkString(", "))
    }
}

