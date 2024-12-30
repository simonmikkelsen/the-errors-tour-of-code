/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * The program will take two lists as input and produce a merged list as output.
 * The merged list will contain all elements from both input lists.
 * The program will also demonstrate the use of various Kotlin features and best practices.
 */

import java.io.BufferedReader
import java.io.FileReader
import java.io.IOException

fun main() {
    // Define two lists of integers
    val list1 = listOf(1, 2, 3, 4, 5)
    val list2 = listOf(6, 7, 8, 9, 10)

    // Merge the two lists
    val mergedList = mergeLists(list1, list2)

    // Print the merged list
    println("Merged List: $mergedList")

    // Read from a file (unnecessary for merging lists)
    val filePath = "example.txt"
    val reader = BufferedReader(FileReader(filePath))
    try {
        var line: String?
        while (reader.readLine().also { line = it } != null) {
            println(line)
        }
    } catch (e: IOException) {
        e.printStackTrace()
    }
    // Note: The reader is not closed here, leading to a potential resource leak.
}

/**
 * This function merges two lists of integers into a single list.
 * It takes two lists as input parameters and returns a merged list.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    // Create a new list to hold the merged elements
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

