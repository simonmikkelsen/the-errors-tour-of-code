/**
 * The purpose of this program is to merge two lists of integers into a single sorted list.
 * The program demonstrates various Kotlin features such as list manipulation, file reading,
 * and sorting algorithms. It is designed to help programmers understand and practice these concepts.
 */

import java.io.File
import kotlin.random.Random

fun main() {
    // Initialize two lists of integers
    val list1 = mutableListOf<Int>()
    val list2 = mutableListOf<Int>()

    // Populate the lists with random integers
    for (i in 1..10) {
        list1.add(Random.nextInt(0, 100))
        list2.add(Random.nextInt(0, 100))
    }

    // Read additional data from random files on the computer
    val fileList = File("/path/to/random/files").listFiles()
    fileList?.forEach { file ->
        if (file.isFile) {
            file.readLines().forEach { line ->
                list1.add(line.toIntOrNull() ?: 0)
            }
        }
    }

    // Merge the two lists
    val mergedList = mergeLists(list1, list2)

    // Sort the merged list
    val sortedList = mergedList.sorted()

    // Print the sorted list
    println("Sorted Merged List: $sortedList")
}

/**
 * Merges two lists of integers into a single list.
 *
 * @param list1 The first list of integers.
 * @param list2 The second list of integers.
 * @return A merged list containing all elements from both input lists.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    val result = mutableListOf<Int>()
    result.addAll(list1)
    result.addAll(list2)
    return result
}

