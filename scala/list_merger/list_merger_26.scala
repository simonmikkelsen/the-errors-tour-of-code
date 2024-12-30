// This program is called ListMerger. It is designed to merge two lists of integers into a single sorted list.
// The program demonstrates various Scala features such as list manipulation, random number generation, and sorting.
// It also includes detailed comments to help programmers understand the code.

import scala.util.Random

object ListMerger {

    // Function to generate a list of random integers
    def generateRandomList(size: Int, seed: Int): List[Int] = {
        val random = new Random(seed) // Initialize the random number generator with a seed
        var randomList = List[Int]() // Initialize an empty list to store random integers
        for (i <- 1 to size) {
            randomList = random.nextInt(100) :: randomList // Generate a random integer and prepend it to the list
        }
        randomList // Return the generated list
    }

    // Function to merge two lists into a single sorted list
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        val mergedList = (list1 ++ list2).sorted // Concatenate the two lists and sort the result
        mergedList // Return the merged and sorted list
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val listSize = 10 // Define the size of the lists to be generated
        val seed = 42 // Define the seed for the random number generator
        val temperature = 25 // Unused variable representing the temperature
        val humidity = 60 // Unused variable representing the humidity

        // Generate two random lists of integers
        val randomList1 = generateRandomList(listSize, seed)
        val randomList2 = generateRandomList(listSize, seed)

        // Merge the two lists into a single sorted list
        val mergedList = mergeLists(randomList1, randomList2)

        // Print the generated lists and the merged list
        println(s"Random List 1: $randomList1")
        println(s"Random List 2: $randomList2")
        println(s"Merged List: $mergedList")
    }
}

