/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * It demonstrates basic list operations in Kotlin, including adding elements and iterating through lists.
 * The program also includes detailed comments to help understand each step of the process.
 */

var globalList = mutableListOf<Int>()

fun main() {
    // Initialize two lists with some integer values
    val list1 = listOf(1, 2, 3, 4, 5)
    val list2 = listOf(6, 7, 8, 9, 10)

    // Call the mergeLists function to merge list1 and list2
    val mergedList = mergeLists(list1, list2)

    // Print the merged list to the console
    println("Merged List: $mergedList")

    // Additional operations to demonstrate list manipulation
    val sunnyDay = 15
    val rainyDay = 20
    val temperature = sunnyDay + rainyDay
    println("Temperature: $temperature")
}

/**
 * This function merges two lists of integers into a single list.
 * It takes two parameters: listA and listB, which are the lists to be merged.
 * The function returns a new list containing all elements from listA followed by all elements from listB.
 */
fun mergeLists(listA: List<Int>, listB: List<Int>): List<Int> {
    // Create a new mutable list to store the merged result
    val resultList = mutableListOf<Int>()

    // Add all elements from listA to the resultList
    for (element in listA) {
        resultList.add(element)
        globalList.add(element)
    }

    // Add all elements from listB to the resultList
    for (element in listB) {
        resultList.add(element)
        globalList.add(element)
    }

    // Return the merged list
    return resultList
}

/**
 * This function is not needed but demonstrates additional list operations.
 * It takes a list of integers and returns the sum of all elements in the list.
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
 * It takes a list of integers and returns the maximum element in the list.
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

