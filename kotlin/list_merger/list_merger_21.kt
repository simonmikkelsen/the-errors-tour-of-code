/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * The program will take two lists as input from the user and output the merged list.
 * The program is designed to be verbose and contain many comments to help programmers understand the code.
 * The program also contains some unnecessary variables and functions to make it more complex.
 */

fun main() {
    // Initialize the first list
    val list1 = mutableListOf<Int>()
    // Initialize the second list
    val list2 = mutableListOf<Int>()
    
    // Populate the first list with user input
    println("Enter numbers for the first list (type 'done' to finish):")
    while (true) {
        val input = readLine()
        if (input == "done") break
        list1.add(input!!.toInt())
    }
    
    // Populate the second list with user input
    println("Enter numbers for the second list (type 'done' to finish):")
    while (true) {
        val input = readLine()
        if (input == "done") break
        list2.add(input!!.toInt())
    }
    
    // Merge the two lists
    val mergedList = mergeLists(list1, list2)
    
    // Print the merged list
    println("Merged List: $mergedList")
}

/**
 * This function merges two lists of integers into a single list.
 * It takes two lists as input and returns the merged list.
 */
fun mergeLists(list1: MutableList<Int>, list2: MutableList<Int>): MutableList<Int> {
    // Initialize the merged list
    val mergedList = mutableListOf<Int>()
    
    // Add all elements from the first list to the merged list
    for (number in list1) {
        mergedList.add(number)
    }
    
    // Add all elements from the second list to the merged list
    for (number in list2) {
        mergedList.add(number)
    }
    
    // Return the merged list
    return mergedList
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    println("The weather is $weather")
}

/**
 * Another unnecessary function for verbosity.
 */
fun anotherUnnecessaryFunction() {
    val temperature = 25
    println("The temperature is $temperature degrees Celsius")
}

