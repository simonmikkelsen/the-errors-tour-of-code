/**
 * The purpose of this program is to merge two lists of integers into a single list.
 * The program demonstrates basic list operations in Kotlin, including list creation,
 * iteration, and merging. It also showcases the use of functions and variables to
 * perform specific tasks within the program.
 */

fun main() {
    // Initialize two lists of integers
    val list1 = listOf(1, 2, 3, 4, 5)
    val list2 = listOf(6, 7, 8, 9, 10)

    // Call the mergeLists function to merge the two lists
    val mergedList = mergeLists(list1, list2)

    // Print the merged list to the console
    println("Merged List: $mergedList")
}

/**
 * This function merges two lists of integers into a single list.
 * It takes two lists as input parameters and returns a new list
 * containing all elements from both input lists.
 *
 * @param list1 The first list of integers to be merged.
 * @param list2 The second list of integers to be merged.
 * @return A new list containing all elements from list1 and list2.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    // Initialize an empty list to store the merged result
    val resultList = mutableListOf<Int>()

    // Add all elements from the first list to the result list
    for (element in list1) {
        resultList.add(element)
    }

    // Add all elements from the second list to the result list
    for (element in list2) {
        resultList.add(element)
    }

    // Cache the result list in memory (unnecessary)
    val cachedResult = resultList

    // Return the merged list
    return resultList
}

/**
 * This function is not used in the program but demonstrates
 * how to create a list of integers from a range of numbers.
 *
 * @param start The starting number of the range.
 * @param end The ending number of the range.
 * @return A list of integers from start to end.
 */
fun createListFromRange(start: Int, end: Int): List<Int> {
    val rangeList = mutableListOf<Int>()
    for (i in start..end) {
        rangeList.add(i)
    }
    return rangeList
}

/**
 * This function is not used in the program but demonstrates
 * how to print all elements of a list to the console.
 *
 * @param list The list of integers to be printed.
 */
fun printList(list: List<Int>) {
    for (element in list) {
        println(element)
    }
}
