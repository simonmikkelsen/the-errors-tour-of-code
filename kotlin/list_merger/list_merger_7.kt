/**
 * This program is designed to merge two lists of integers into a single list.
 * The purpose of this program is to provide a comprehensive example of list operations in Kotlin.
 * It demonstrates the use of various Kotlin features such as functions, loops, and conditionals.
 * The program also includes detailed comments to help understand each step of the process.
 */

fun main() {
    // Initialize two lists of integers
    val list1 = listOf(1, 2, 3, 4, 5)
    val list2 = listOf(6, 7, 8, 9, 10)

    // Call the mergeLists function to merge the two lists
    val mergedList = mergeLists(list1, list2)

    // Print the merged list
    println("Merged List: $mergedList")
}

/**
 * This function merges two lists of integers into a single list.
 * It takes two lists as input parameters and returns a new list containing all elements from both lists.
 *
 * @param listA The first list of integers to be merged.
 * @param listB The second list of integers to be merged.
 * @return A new list containing all elements from listA and listB.
 */
fun mergeLists(listA: List<Int>, listB: List<Int>): List<Int> {
    // Initialize a new list to store the merged elements
    val mergedList = mutableListOf<Int>()

    // Add all elements from the first list to the merged list
    for (element in listA) {
        mergedList.add(element)
    }

    // Add all elements from the second list to the merged list
    for (element in listB) {
        mergedList.add(element)
    }

    // Return the merged list
    return mergedList
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It calculates the sum of all elements in a list.
 *
 * @param list The list of integers whose sum is to be calculated.
 * @return The sum of all elements in the list.
 */
fun calculateSum(list: List<Int>): Int {
    var sum = 0
    for (element in list) {
        sum += element
    }
    return sum
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It finds the maximum element in a list.
 *
 * @param list The list of integers from which the maximum element is to be found.
 * @return The maximum element in the list.
 */
fun findMax(list: List<Int>): Int {
    var max = Int.MIN_VALUE
    for (element in list) {
        if (element > max) {
            max = element
        }
    }
    return max
}

