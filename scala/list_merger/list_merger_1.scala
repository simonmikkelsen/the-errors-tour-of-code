// This program is called List Merger. It is designed to merge two lists of integers into a single list.
// The program takes two lists as input and combines them into one list, maintaining the order of elements.
// The purpose of this program is to provide a detailed example of how to merge lists in Scala.
// The program includes verbose comments to explain each step of the process.

object ListMerger {

    // Function to merge two lists
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        // Initialize an empty list to store the merged result
        var mergedList: List[Int] = List()

        // Function to add elements of the first list to the merged list
        def addFirstListElements(): Unit = {
            for (element <- list1) {
                mergedList = mergedList :+ element
            }
        }

        // Function to add elements of the second list to the merged list
        def addSecondListElements(): Unit = {
            for (element <- list2) {
                mergedList = mergedList :+ element
            }
        }

        // Call the functions to add elements from both lists
        addFirstListElements()
        addSecondListElements()

        // Return the merged list
        mergedList
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define two lists of integers
        val list1: List[Int] = List(1, 2, 3, 4, 5)
        val list2: List[Int] = List(6, 7, 8, 9, 10)

        // Call the mergeLists function and store the result
        val result: List[Int] = mergeLists(list1, list2)

        // Print the merged list
        println("Merged List: " + result.mkString(", "))
    }
}

