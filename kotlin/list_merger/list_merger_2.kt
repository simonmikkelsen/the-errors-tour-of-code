/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * The program will take two lists as input and produce a merged list as output.
 * The merged list will contain all elements from both input lists, in the order they appear.
 * This program is designed to demonstrate various Kotlin programming concepts,
 * including list manipulation, loops, and functions.
 */

fun main() {
    // Initialize two lists with some sample data
    val list1 = listOf(1, 2, 3, 4, 5)
    val list2 = listOf(6, 7, 8, 9, 10)

    // Call the mergeLists function to merge the two lists
    val mergedList = mergeLists(list1, list2)

    // Print the merged list to the console
    println("Merged List: $mergedList")
}

/**
 * This function merges two lists of integers into a single list.
 * It takes two lists as input parameters and returns a new list containing all elements from both input lists.
 * The elements from the first list will appear first in the merged list, followed by the elements from the second list.
 *
 * @param list1 The first list of integers to be merged.
 * @param list2 The second list of integers to be merged.
 * @return A new list containing all elements from both input lists.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    // Create a new mutable list to hold the merged elements
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
 * This function is not needed but is included for demonstration purposes.
 * It takes a list of integers and returns the sum of all elements in the list.
 *
 * @param list The list of integers to be summed.
 * @return The sum of all elements in the list.
 */
fun sumList(list: List<Int>): Int {
    var sum = 0
    for (element in list) {
        sum += element
    }
    return sum
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes a list of integers and returns the average of all elements in the list.
 *
 * @param list The list of integers to be averaged.
 * @return The average of all elements in the list.
 */
fun averageList(list: List<Int>): Double {
    val sum = sumList(list)
    return sum.toDouble() / list.size
}

