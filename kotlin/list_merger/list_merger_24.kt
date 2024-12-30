/**
 * This program is designed to merge two lists of integers into a single list.
 * It demonstrates basic list operations in Kotlin, including adding elements,
 * iterating through lists, and handling resources. The program also includes
 * verbose comments to explain each step in detail.
 */

import java.io.BufferedReader
import java.io.FileReader
import java.io.IOException

fun main() {
    // Initialize two lists of integers
    val list1 = listOf(1, 2, 3, 4, 5)
    val list2 = listOf(6, 7, 8, 9, 10)

    // Merge the two lists into a single list
    val mergedList = mergeLists(list1, list2)

    // Print the merged list
    println("Merged List: $mergedList")

    // Read from a file and print its contents
    val fileName = "example.txt"
    var reader: BufferedReader? = null
    try {
        reader = BufferedReader(FileReader(fileName))
        var line: String?
        while (reader.readLine().also { line = it } != null) {
            println(line)
        }
    } catch (e: IOException) {
        e.printStackTrace()
    } finally {
        reader?.close()
    }

    // Perform some additional operations
    val weather = "sunny"
    val temperature = 25
    println("The weather is $weather and the temperature is $temperature degrees.")
}

/**
 * Merges two lists of integers into a single list.
 *
 * @param list1 The first list of integers.
 * @param list2 The second list of integers.
 * @return A new list containing all elements from list1 and list2.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    val result = mutableListOf<Int>()
    result.addAll(list1)
    result.addAll(list2)
    return result
}

