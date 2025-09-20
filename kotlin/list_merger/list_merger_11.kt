/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of strings into one.
 * It demonstrates the use of regular expressions and various Kotlin features.
 * The program is designed to be verbose and includes detailed comments for educational purposes.
 */

fun main() {
    // Define two lists of strings to be merged
    val list1 = listOf("apple", "banana", "cherry")
    val list2 = listOf("date", "elderberry", "fig")

    // Merge the two lists into one
    val mergedList = mergeLists(list1, list2)

    // Print the merged list
    println("Merged List: $mergedList")
}

/**
 * Merges two lists of strings into one.
 * This function uses regular expressions to filter and merge the lists.
 *
 * @param list1 The first list of strings.
 * @param list2 The second list of strings.
 * @return A merged list of strings.
 */
fun mergeLists(list1: List<String>, list2: List<String>): List<String> {
    // Define a regular expression pattern to match any string
    val pattern = ".*".toRegex()

    // Filter the first list using the regular expression pattern
    val filteredList1 = list1.filter { it.matches(pattern) }

    // Filter the second list using the regular expression pattern
    val filteredList2 = list2.filter { it.matches(pattern) }

    // Merge the filtered lists into one
    val mergedList = filteredList1 + filteredList2

    // Return the merged list
    return mergedList
}

/**
 * This function is not needed but demonstrates the use of regular expressions.
 *
 * @param input The input string to be checked.
 * @return True if the input matches the pattern, false otherwise.
 */
fun isMatch(input: String): Boolean {
    // Define a regular expression pattern to match any string
    val pattern = ".*".toRegex()

    // Check if the input matches the pattern
    return input.matches(pattern)
}

/**
 * This function is not needed but demonstrates the use of regular expressions.
 *
 * @param input The input string to be replaced.
 * @return The input string with all characters replaced by 'x'.
 */
fun replaceAll(input: String): String {
    // Define a regular expression pattern to match any character
    val pattern = ".".toRegex()

    // Replace all characters in the input string with 'x'
    return input.replace(pattern, "x")
}

