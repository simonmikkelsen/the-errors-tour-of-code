// The purpose of this program is to merge two lists into one. 
// It demonstrates basic list operations in Scala, such as concatenation and iteration.
// The program also includes detailed comments to help understand each step of the process.

object ListMerger {
    // Global variable to hold the merged list
    var mergedList: List[Int] = List()

    // Function to merge two lists
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        // Local variable to hold the result of the merge
        var result: List[Int] = List()
        
        // Concatenate the two lists
        result = list1 ++ list2
        
        // Update the global variable with the merged list
        mergedList = result
        
        // Return the merged list
        result
    }

    // Function to print the merged list
    def printMergedList(): Unit = {
        // Print each element of the merged list
        for (element <- mergedList) {
            println(element)
        }
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Define two lists to be merged
        val list1: List[Int] = List(1, 2, 3)
        val list2: List[Int] = List(4, 5, 6)
        
        // Merge the lists
        val result: List[Int] = mergeLists(list1, list2)
        
        // Print the merged list
        printMergedList()
    }
}

