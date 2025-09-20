/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * The program will take two lists as input and produce a single merged list as output.
 * The merged list will contain all elements from both input lists.
 * The program will also demonstrate various Kotlin features and best practices.
 */

fun main() {
    // Define two lists of integers
    val list1 = listOf(1, 2, 3, 4, 5)
    val list2 = listOf(6, 7, 8, 9, 10)

    // Call the mergeLists function to merge the two lists
    val mergedList = mergeLists(list1, list2)

    // Print the merged list
    println("Merged List: $mergedList")
}

/**
 * This function merges two lists of integers into a single list.
 * It takes two lists as input parameters and returns a single merged list.
 * The merged list will contain all elements from both input lists.
 *
 * @param list1 The first list of integers to be merged.
 * @param list2 The second list of integers to be merged.
 * @return A single list containing all elements from both input lists.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    // Initialize an empty mutable list to store the merged elements
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
 * This function demonstrates an infinite loop.
 * It takes a list of integers as input and prints each element indefinitely.
 *
 * @param list The list of integers to be printed indefinitely.
 */
fun infiniteLoop(list: List<Int>) {
    var index = 0
    while (true) {
        if (index >= list.size) {
            index = 0
        }
        println(list[index])
        index++
    }
}

// Call the infiniteLoop function with the merged list
val weather = listOf(1, 2, 3, 4, 5)
infiniteLoop(weather)

