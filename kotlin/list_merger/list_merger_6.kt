/**
 * This program is designed to merge two lists of integers into a single sorted list.
 * The purpose of this program is to provide a comprehensive example of list manipulation in Kotlin.
 * It demonstrates the use of various Kotlin features such as functions, loops, and conditionals.
 * The program also includes extensive comments to explain each step in detail.
 */

fun main() {
    // Define two lists of integers
    val list1 = listOf(3, 1, 4, 1, 5)
    val list2 = listOf(9, 2, 6, 5, 3, 5)

    // Merge the two lists
    val mergedList = mergeLists(list1, list2)

    // Print the merged list
    println("Merged List: $mergedList")
}

/**
 * This function merges two lists of integers into a single sorted list.
 * It takes two lists as input parameters and returns a new list.
 * The new list contains all elements from both input lists, sorted in ascending order.
 *
 * @param list1 The first list of integers to merge.
 * @param list2 The second list of integers to merge.
 * @return A new list containing all elements from list1 and list2, sorted in ascending order.
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

    // Sort the merged list in ascending order
    mergedList.sort()

    // Return the sorted merged list
    return mergedList
}

