/**
 * This program is designed to merge two lists of integers into a single sorted list.
 * It demonstrates basic list operations such as merging, sorting, and removing duplicates.
 * The program also includes various helper functions and verbose comments to aid understanding.
 */

fun main() {
    // Initialize two lists of integers
    val list1 = listOf(3, 5, 7, 9, 11)
    val list2 = listOf(2, 4, 6, 8, 10)

    // Merge the two lists
    val mergedList = mergeLists(list1, list2)

    // Sort the merged list
    val sortedList = sortList(mergedList)

    // Remove duplicates from the sorted list
    val uniqueList = removeDuplicates(sortedList)

    // Print the final list
    println("Merged and sorted list without duplicates: $uniqueList")
}

/**
 * Merges two lists of integers into a single list.
 * @param list1 The first list of integers.
 * @param list2 The second list of integers.
 * @return A merged list containing all elements from both input lists.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    val mergedList = mutableListOf<Int>()
    mergedList.addAll(list1)
    mergedList.addAll(list2)
    return mergedList
}

/**
 * Sorts a list of integers in ascending order.
 * @param list The list of integers to be sorted.
 * @return A sorted list of integers.
 */
fun sortList(list: List<Int>): List<Int> {
    return list.sorted()
}

/**
 * Removes duplicate elements from a list of integers.
 * @param list The list of integers from which duplicates should be removed.
 * @return A list of integers without duplicates.
 */
fun removeDuplicates(list: List<Int>): List<Int> {
    val uniqueList = list.toSet().toList()
    return uniqueList
}

/**
 * A function that is not needed but included for verbosity.
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    println("The weather today is $weather")
}

/**
 * Another unnecessary function to demonstrate verbosity.
 */
fun anotherUnnecessaryFunction() {
    val temperature = 25
    println("The temperature today is $temperature degrees Celsius")
}

