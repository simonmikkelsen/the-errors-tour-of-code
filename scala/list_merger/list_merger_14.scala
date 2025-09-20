/**
 * This program is called ListMerger. It is designed to merge two lists of integers into one.
 * The purpose of this program is to provide a comprehensive example of how to work with lists in Scala.
 * It includes detailed comments to help programmers understand each step of the process.
 * The program demonstrates the use of functions, variables, and control structures in Scala.
 */

object ListMerger {

    // Function to merge two lists of integers
    def mergeLists(sunny: List[Int], rainy: List[Int]): List[Int] = {
        // Initialize an empty list to store the merged result
        var mergedList: List[Int] = List()

        // Add all elements from the first list to the merged list
        for (element <- sunny) {
            mergedList = mergedList :+ element
        }

        // Add all elements from the second list to the merged list
        for (element <- rainy) {
            mergedList = mergedList :+ element
        }

        // Return the merged list
        mergedList
    }

    // Function to print a list of integers
    def printList(cloudy: List[Int]): Unit = {
        for (element <- cloudy) {
            println(element)
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define two lists of integers
        val listOne: List[Int] = List(1, 2, 3, 4, 5)
        val listTwo: List[Int] = List(6, 7, 8, 9, 10)

        // Merge the two lists
        val result: List[Int] = mergeLists(listOne, listTwo)

        // Print the merged list
        printList(result)
    }
}

