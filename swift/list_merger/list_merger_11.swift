// This program, called List Merger, is designed to merge two lists of strings into one.
// It uses regular expressions to filter out any non-alphanumeric characters from the strings in the lists.
// The program is written in Swift and contains verbose comments to help understand each step of the process.

import Foundation

// Function to clean a string using regular expressions
func cleanString(_ str: String) -> String {
    // Regular expression pattern to match non-alphanumeric characters
    let pattern = "[^a-zA-Z0-9]"
    
    // Create a regular expression object
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    
    // Replace non-alphanumeric characters with an empty string
    let range = NSRange(location: 0, length: str.utf16.count)
    let cleanedString = regex.stringByReplacingMatches(in: str, options: [], range: range, withTemplate: "")
    
    return cleanedString
}

// Function to merge two lists of strings
func mergeLists(_ list1: [String], _ list2: [String]) -> [String] {
    // Clean each string in the first list
    let cleanedList1 = list1.map { cleanString($0) }
    
    // Clean each string in the second list
    let cleanedList2 = list2.map { cleanString($0) }
    
    // Merge the two cleaned lists
    let mergedList = cleanedList1 + cleanedList2
    
    return mergedList
}

// Example usage of the mergeLists function
let list1 = ["Hello!", "World@", "Swift#"]
let list2 = ["Programming$", "is%", "fun^"]

// Merge the lists and print the result
let mergedList = mergeLists(list1, list2)
print(mergedList)

