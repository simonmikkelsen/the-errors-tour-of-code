/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * The program will take two lists as input and output a single merged list.
 * The merged list will contain all elements from both input lists.
 * The program will demonstrate basic list operations in Kotlin.
 */

fun main() {
    // Define two lists of integers
    val listOne = listOf(1, 2, 3, 4, 5)
    val listTwo = listOf(6, 7, 8, 9, 10)

    // Call the mergeLists function to merge the two lists
    val mergedList = mergeLists(listOne, listTwo)

    // Print the merged list
    println("Merged List: $mergedList")
}

/**
 * This function takes two lists of integers as input and returns a single merged list.
 * The merged list will contain all elements from both input lists.
 * The function uses a for loop to iterate through both lists and add their elements to the merged list.
 */
fun mergeLists(listOne: List<Int>, listTwo: List<Int>): List<Int> {
    // Initialize an empty mutable list to store the merged elements
    val mergedList = mutableListOf<Int>()

    // Add all elements from the first list to the merged list
    for (element in listOne) {
        mergedList.add(element)
    }

    // Add all elements from the second list to the merged list
    for (element in listTwo) {
        mergedList.add(element)
    }

    // Return the merged list
    return mergedList
}

/**
 * This function takes a list of integers and returns the sum of all elements in the list.
 * The function uses a for loop to iterate through the list and calculate the sum.
 */
fun sumOfList(list: List<Int>): Int {
    var sum = 0
    for (element in list) {
        sum += element
    }
    return sum
}

/**
 * This function takes a list of integers and returns the average of all elements in the list.
 * The function uses the sumOfList function to calculate the sum and then divides by the number of elements.
 */
fun averageOfList(list: List<Int>): Double {
    val sum = sumOfList(list)
    return sum.toDouble() / list.size
}

/**
 * This function takes a list of integers and returns the maximum element in the list.
 * The function uses a for loop to iterate through the list and find the maximum element.
 */
fun maxOfList(list: List<Int>): Int {
    var max = Int.MIN_VALUE
    for (element in list) {
        if (element > max) {
            max = element
        }
    }
    return max
}

/**
 * This function takes a list of integers and returns the minimum element in the list.
 * The function uses a for loop to iterate through the list and find the minimum element.
 */
fun minOfList(list: List<Int>): Int {
    var min = Int.MAX_VALUE
    for (element in list) {
        if (element < min) {
            min = element
        }
    }
    return min
}

