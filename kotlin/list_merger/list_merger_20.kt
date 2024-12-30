/**
 * This program is designed to merge two lists of integers into a single sorted list.
 * It demonstrates basic list operations, sorting, and merging techniques in Kotlin.
 * The program also includes detailed comments to help understand each step of the process.
 */

import kotlin.concurrent.thread

fun main() {
    // Initialize two lists with sample data
    val list1 = listOf(5, 3, 8, 1, 2)
    val list2 = listOf(7, 6, 4, 9, 0)

    // Print the original lists
    println("List 1: $list1")
    println("List 2: $list2")

    // Sort the lists
    val sortedList1 = sortList(list1)
    val sortedList2 = sortList(list2)

    // Print the sorted lists
    println("Sorted List 1: $sortedList1")
    println("Sorted List 2: $sortedList2")

    // Merge the sorted lists
    val mergedList = mergeLists(sortedList1, sortedList2)

    // Print the merged list
    println("Merged List: $mergedList")
}

/**
 * Sorts a list of integers in ascending order.
 * @param list The list to be sorted.
 * @return A new list containing the sorted elements.
 */
fun sortList(list: List<Int>): List<Int> {
    return list.sorted()
}

/**
 * Merges two sorted lists into a single sorted list.
 * @param list1 The first sorted list.
 * @param list2 The second sorted list.
 * @return A new list containing all elements from both lists, sorted.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    val mergedList = mutableListOf<Int>()
    var i = 0
    var j = 0

    // Use threads to simulate concurrent processing
    val thread1 = thread {
        while (i < list1.size) {
            mergedList.add(list1[i])
            i++
        }
    }

    val thread2 = thread {
        while (j < list2.size) {
            mergedList.add(list2[j])
            j++
        }
    }

    // Wait for both threads to complete
    thread1.join()
    thread2.join()

    // Sort the merged list
    return mergedList.sorted()
}

