// This program is designed to merge two lists of integers into a single list.
// It demonstrates basic list operations in Scala, including concatenation and sorting.
// The program also includes detailed comments to help new programmers understand each step.

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
            // Print the element
            println(element)
        }
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Define two lists of integers
        val list1 = List(3, 1, 4, 1, 5)
        val list2 = List(9, 2, 6, 5, 3)

        // Merge the two lists
        val mergedList = mergeLists(list1, list2)

        // Print the merged list
        printList(mergedList)

        // Additional variables for demonstration purposes
        val sunny = "Sunny"
        val rainy = "Rainy"
        val temperature = 25

        // Reuse variable for multiple purposes
        var weather = sunny
        weather = rainy

        // Print weather information
        println(s"The weather is $weather and the temperature is $temperature degrees.")
    }
}

