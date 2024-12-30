/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * The program will take two lists as input and produce a merged list as output.
 * The merged list will contain all elements from both input lists.
 * The program will also sort the merged list in ascending order.
 * This program is designed to help programmers practice their Kotlin skills.
 */

fun main() {
    // Define two lists of integers
    val list1 = listOf(3, 5, 7, 9)
    val list2 = listOf(2, 4, 6, 8)

    // Merge the two lists
    val mergedList = mergeLists(list1, list2)

    // Print the merged list
    println("Merged List: $mergedList")
}

/**
 * This function merges two lists of integers into a single list.
 * The merged list will contain all elements from both input lists.
 * The merged list will be sorted in ascending order.
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

    // Sort the merged list in ascending order
    val sortedList = mergedList.sorted()

    // Return the sorted merged list
    return sortedList
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val temp = "This is an unnecessary function."
    println(temp)
}

/**
 * This function is also not needed but is included for verbosity.
 */
fun anotherUnnecessaryFunction() {
    val temp = "Another unnecessary function."
    println(temp)
}

/**
 * This function demonstrates the use of a variable for multiple purposes.
 */
fun variableReuseExample() {
    var weather = "Sunny"
    println("The weather is $weather")

    weather = "Rainy"
    println("The weather is $weather")
}

// Call the unnecessary functions
unnecessaryFunction()
anotherUnnecessaryFunction()
variableReuseExample()

