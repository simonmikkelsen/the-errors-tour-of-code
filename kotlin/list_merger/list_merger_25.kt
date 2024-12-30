/**
 * This program is designed to merge two lists of integers into a single sorted list.
 * It demonstrates the use of Kotlin's collection manipulation functions and random number generation.
 * The program also showcases the use of verbose comments to explain each step in detail.
 */

import kotlin.random.Random

fun main() {
    // Initialize the random number generator with a seed
    val random = Random(1337)

    // Generate two lists of random integers
    val list1 = generateRandomList(random, 10)
    val list2 = generateRandomList(random, 10)

    // Merge the two lists into a single list
    val mergedList = mergeLists(list1, list2)

    // Sort the merged list
    val sortedList = mergedList.sorted()

    // Print the sorted list
    println("Sorted Merged List: $sortedList")
}

/**
 * Generates a list of random integers.
 *
 * @param random The random number generator to use.
 * @param size The size of the list to generate.
 * @return A list of random integers.
 */
fun generateRandomList(random: Random, size: Int): List<Int> {
    val randomList = mutableListOf<Int>()
    for (i in 0 until size) {
        randomList.add(random.nextInt(0, 100))
    }
    return randomList
}

/**
 * Merges two lists of integers into a single list.
 *
 * @param list1 The first list to merge.
 * @param list2 The second list to merge.
 * @return A merged list containing all elements from both input lists.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    val mergedList = mutableListOf<Int>()
    mergedList.addAll(list1)
    mergedList.addAll(list2)
    return mergedList
}

