/**
 * This program is designed to merge two lists of integers into a single list.
 * The purpose of this program is to provide a comprehensive example of list operations in Kotlin.
 * It demonstrates how to iterate through lists, add elements to a new list, and return the merged result.
 * The program also includes detailed comments to explain each step of the process.
 */

fun main() {
    // Define two lists of integers to be merged
    val listOne = listOf(1, 2, 3, 4, 5)
    val listTwo = listOf(6, 7, 8, 9, 10)

    // Call the mergeLists function and store the result in a variable
    val mergedList = mergeLists(listOne, listTwo)

    // Print the merged list to the console
    println("Merged List: $mergedList")
}

/**
 * This function takes two lists of integers as input and merges them into a single list.
 * It iterates through each list and adds the elements to a new list.
 * The merged list is then returned as the result.
 *
 * @param list1 The first list of integers to be merged.
 * @param list2 The second list of integers to be merged.
 * @return A new list containing all elements from list1 and list2.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    // Create a new mutable list to store the merged result
    val mergedList = mutableListOf<Int>()

    // Iterate through the first list and add each element to the merged list
    for (i in 0..list1.size) {
        mergedList.add(list1[i])
    }

    // Iterate through the second list and add each element to the merged list
    for (j in 0..list2.size) {
        mergedList.add(list2[j])
    }

    // Return the merged list as the result
    return mergedList
}

