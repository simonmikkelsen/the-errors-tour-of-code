// The purpose of this program is to merge two lists of integers into a single list.
// It demonstrates basic list operations in Scala, including concatenation and sorting.
// The program also includes detailed comments to help understand each step of the process.

object ListMerger {

    // Function to merge two lists
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        // Concatenate the two lists
        val concatenatedList = list1 ++ list2

        // Sort the concatenated list
        val sortedList = concatenatedList.sorted

        // Return the sorted list
        sortedList
    }

    // Function to print a list
    def printList(list: List[Int]): Unit = {
        // Iterate through each element in the list
        for (element <- list) {
            // Print the current element
            println(element)
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define the first list of integers
        val list1 = List(3, 1, 4, 1, 5, 9)

        // Define the second list of integers
        val list2 = List(2, 7, 1, 8, 2, 8)

        // Merge the two lists
        val mergedList = mergeLists(list1, list2)

        // Print the merged list
        printList(mergedList)

        // Additional variables and functions that are not needed
        val temperature = 25
        val humidity = 60
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Reusing a variable for multiple purposes
        var weather = "sunny"
        weather = "rainy"
        println(s"The weather is $weather")
    }
}

