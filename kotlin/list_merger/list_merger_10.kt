/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists provided by the user.
 * It demonstrates basic Kotlin syntax, user input handling, and list operations.
 * The program will prompt the user to enter two lists of integers.
 * It will then merge these lists into a single list and display the result.
 */

fun main() {
    // Prompt the user to enter the first list of integers
    println("Enter the first list of integers (comma-separated):")
    val firstListInput = readLine() ?: ""
    
    // Convert the input string to a list of integers
    val firstList = firstListInput.split(",").map { it.trim().toInt() }.toMutableList()
    
    // Prompt the user to enter the second list of integers
    println("Enter the second list of integers (comma-separated):")
    val secondListInput = readLine() ?: ""
    
    // Convert the input string to a list of integers
    val secondList = secondListInput.split(",").map { it.trim().toInt() }.toMutableList()
    
    // Merge the two lists
    val mergedList = mergeLists(firstList, secondList)
    
    // Display the merged list
    println("Merged List: $mergedList")
}

/**
 * This function merges two lists of integers into a single list.
 * It takes two lists as input parameters and returns the merged list.
 */
fun mergeLists(list1: MutableList<Int>, list2: MutableList<Int>): MutableList<Int> {
    // Create a new list to hold the merged result
    val resultList = mutableListOf<Int>()
    
    // Add all elements from the first list to the result list
    resultList.addAll(list1)
    
    // Add all elements from the second list to the result list
    resultList.addAll(list2)
    
    // Return the merged list
    return resultList
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It takes a list of integers and returns the sum of all elements in the list.
 */
fun sumList(list: List<Int>): Int {
    var sum = 0
    for (number in list) {
        sum += number
    }
    return sum
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It takes a list of integers and returns the average of all elements in the list.
 */
fun averageList(list: List<Int>): Double {
    val sum = sumList(list)
    return sum.toDouble() / list.size
}

