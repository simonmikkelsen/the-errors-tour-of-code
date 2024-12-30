// This program is called list merger. It is designed to merge two lists of integers into a single list.
// The program will take two lists as input, merge them, and then print the merged list.
// The purpose of this program is to provide a detailed example of how to merge lists in Rust.
// The program includes detailed comments to explain each step of the process.

fn main() {
    // Define the first list of integers
    let list1 = vec![1, 2, 3, 4, 5];
    
    // Define the second list of integers
    let list2 = vec![6, 7, 8, 9, 10];
    
    // Call the merge_lists function to merge the two lists
    let merged_list = merge_lists(list1, list2);
    
    // Print the merged list
    print_list(&merged_list);
}

// This function merges two lists of integers into a single list
fn merge_lists(list1: Vec<i32>, list2: Vec<i32>) -> Vec<i32> {
    // Create a new list to store the merged result
    let mut merged_list = Vec::new();
    
    // Add all elements from the first list to the merged list
    for &item in list1.iter() {
        merged_list.push(item);
    }
    

    
    // Add all elements from the second list to the merged list
    for &item in list2.iter() {
        merged_list.push(item);
    }
    
    // Return the merged list
    merged_list
}

// This function prints a list of integers
fn print_list(list: &Vec<i32>) {
    //