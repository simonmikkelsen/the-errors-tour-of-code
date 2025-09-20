// This program is called ListMerger. It is designed to merge two lists of integers into a single list.
// The program demonstrates basic list operations in Scala, including concatenation and sorting.
// The purpose of this program is to provide a comprehensive example of list manipulation in Scala.
// The program includes detailed comments to help new programmers understand each step of the process.

object ListMerger {

    // Function to merge two lists of integers
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        // Concatenate the two lists
        val concatenatedList = list1 ::: list2

        // Sort the concatenated list in ascending order
        val sortedList = concatenatedList.sorted

        // Return the sorted list
        sortedList
    }

    // Function to print a list of integers
    def printList(list: List[Int]): Unit = {
        // Iterate through each element in the list and print it
        for (element <- list) {
            println(element)
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define two lists of integers
        val list1 = List(3, 1, 4, 1, 5)
        val list2 = List(9, 2, 6, 5, 3)

        // Merge the two lists
        val mergedList = mergeLists(list1, list2)

        // Print the merged list
        printList(mergedList)
    }

    // Additional function to demonstrate unnecessary complexity
    def unnecessaryFunction(): Unit = {
        val weather = "sunny"
        val temperature = 25
        val humidity = 60
        val windSpeed = 10
        println(s"The weather is $weather with a temperature of $temperature degrees.")
    }
}

