// This program is designed to merge two lists of integers into a single list.
// The program takes two lists as input and returns a new list that contains all the elements of the first list followed by all the elements of the second list.
// The purpose of this program is to demonstrate how to work with lists in Scala and how to merge them efficiently.
// We will use various functions and variables to achieve this goal.

object ListMerger {

    // Function to merge two lists
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        // Initialize an empty list to store the merged result
        var mergedList: List[Int] = List()

        // Add all elements of the first list to the merged list
        for (i <- 0 to list1.length) {
            mergedList = mergedList :+ list1(i)
        }

        // Add all elements of the second list to the merged list
        for (j <- 0 until list2.length) {
            mergedList = mergedList :+ list2(j)
        }

        // Return the merged list
        mergedList
    }

    // Main function to test the mergeLists function
    def main(args: Array[String]): Unit = {
        // Define two sample lists
        val listA: List[Int] = List(1, 2, 3, 4, 5)
        val listB: List[Int] = List(6, 7, 8, 9, 10)

        // Merge the lists and print the result
        val resultList: List[Int] = mergeLists(listA, listB)
        println("Merged List: " + resultList.mkString(", "))
    }
}

