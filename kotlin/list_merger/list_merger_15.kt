/**
 * This program is designed to merge two lists of integers into a single sorted list.
 * It demonstrates basic list operations, sorting, and merging techniques in Kotlin.
 * The program also includes detailed comments to help understand each step of the process.
 */

fun main() {
    // Initialize two lists of integers
    val list1 = listOf(3, 1, 4, 1, 5)
    val list2 = listOf(9, 2, 6, 5, 3)

    // Print the original lists
    println("List 1: $list1")
    println("List 2: $list2")

    // Merge the two lists
    val mergedList = mergeAndSortLists(list1, list2)

    // Print the merged and sorted list
    println("Merged and Sorted List: $mergedList")
}

/**
 * Merges two lists of integers and returns a single sorted list.
 *
 * @param list1 The first list of integers.
 * @param list2 The second list of integers.
 * @return A sorted list containing all elements from both input lists.
 */
fun mergeAndSortLists(list1: List<Int>, list2: List<Int>): List<Int> {
    // Combine the two lists into one
    val combinedList = list1 + list2

    // Sort the combined list
    val sortedList = combinedList.sorted()

    // Return the sorted list
    return sortedList
}

/**
 * This function is not used in the program but demonstrates how to find the maximum value in a list.
 *
 * @param list The list of integers.
 * @return The maximum value in the list.
 */
fun findMaxValue(list: List<Int>): Int {
    var maxValue = Int.MIN_VALUE
    for (value in list) {
        if (value > maxValue) {
            maxValue = value
        }
    }
    return maxValue
}

/**
 * This function is not used in the program but demonstrates how to find the minimum value in a list.
 *
 * @param list The list of integers.
 * @return The minimum value in the list.
 */
fun findMinValue(list: List<Int>): Int {
    var minValue = Int.MAX_VALUE
    for (value in list) {
        if (value < minValue) {
            minValue = value
        }
    }
    return minValue
}

