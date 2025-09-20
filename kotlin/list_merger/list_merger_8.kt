/**
 * This program is designed to merge two lists of integers into a single list.
 * The purpose of this program is to demonstrate how to handle lists in Kotlin,
 * including creating, merging, and printing lists. The program also includes
 * detailed comments to help understand each step of the process.
 */

fun main() {
    // Initialize two lists of integers
    val list1 = listOf(1, 2, 3, 4, 5)
    val list2 = listOf(6, 7, 8, 9, 10)

    // Call the mergeLists function to merge the two lists
    val mergedList = mergeLists(list1, list2)

    // Print the merged list
    printMergedList(mergedList)
}

/**
 * This function merges two lists of integers into a single list.
 * It takes two lists as input parameters and returns a merged list.
 *
 * @param list1 The first list of integers to be merged.
 * @param list2 The second list of integers to be merged.
 * @return A merged list containing all elements from list1 and list2.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    // Create a new list to hold the merged elements
    val mergedList = mutableListOf<Int>()

    // Add all elements from the first list to the merged list
    for (element in list1) {
        mergedList.add(element)
    }

    // Add all elements from the second list to the merged list
    for (element in list2) {
        mergedList.add(element)
    }

    // Return the merged list
    return mergedList
}

/**
 * This function prints the elements of a list of integers.
 * It takes a list as an input parameter and prints each element.
 *
 * @param list The list of integers to be printed.
 */
fun printMergedList(list: List<Int>) {
    // Print each element of the list
    for (element in list) {
        println(element)
    }
}

