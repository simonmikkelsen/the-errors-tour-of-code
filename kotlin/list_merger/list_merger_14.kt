/**
 * This program is designed to merge two lists of integers into a single list.
 * It demonstrates basic list operations in Kotlin, including list creation,
 * iteration, and merging. The program also includes verbose comments to help
 * understand each step of the process.
 */

fun main() {
    // Initialize two lists of integers
    val sunnyDay = listOf(1, 2, 3, 4, 5)
    val rainyDay = listOf(6, 7, 8, 9, 10)

    // Call the function to merge the lists
    val mergedList = mergeLists(sunnyDay, rainyDay)

    // Print the merged list
    println("Merged List: $mergedList")
}

/**
 * This function takes two lists of integers and merges them into a single list.
 * It iterates through both lists and adds each element to a new list.
 *
 * @param listA The first list of integers to merge.
 * @param listB The second list of integers to merge.
 * @return A new list containing all elements from listA and listB.
 */
fun mergeLists(listA: List<Int>, listB: List<Int>): List<Int> {
    // Initialize a new list to hold the merged elements
    val merged = mutableListOf<Int>()

    // Iterate through the first list and add each element to the merged list
    for (element in listA) {
        merged.add(element)
    }

    // Iterate through the second list and add each element to the merged list
    for (element in listB) {
        merged.add(element)
    }

    // Return the merged list
    return merged
}

/**
 * This function is not needed but demonstrates additional list operations.
 * It calculates the sum of all elements in a list.
 *
 * @param list The list of integers to sum.
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
 * This function is not needed but demonstrates additional list operations.
 * It finds the maximum element in a list.
 *
 * @param list The list of integers to search.
 * @return The maximum element in the list.
 */
fun findMax(list: List<Int>): Int {
    var max = list[0]
    for (element in list) {
        if (element > max) {
            max = element
        }
    }
    return max
}

