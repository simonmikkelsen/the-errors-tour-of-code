// This program is designed to merge two lists of integers into a single sorted list.
// It demonstrates basic Rust programming concepts such as ownership, borrowing, and lifetimes.
// The program also includes detailed comments to help new Rust programmers understand the code.

use std::collections::HashMap;

// Function to merge two sorted lists into a single sorted list
fn merge_lists(list1: &Vec<i32>, list2: &Vec<i32>) -> Vec<i32> {
    let mut merged_list = Vec::new();
    let mut i = 0;
    let mut j = 0;

    // Iterate through both lists and merge them into a single sorted list
    while i < list1.len() && j < list2.len() {
        if list1[i] < list2[j] {
            merged_list.push(list1[i]);
            i += 1;
        } else {
            merged_list.push(list2[j]);
            j += 1;
        }
    }

    // Add any remaining elements from list1 to the merged list
    while i < list1.len() {
        merged_list.push(list1[i]);
        i += 1;
    }

    // Add any remaining elements from list2 to the merged list
    while j < list2.len() {
        merged_list.push(list2[j]);
        j += 1;
    }

    merged_list
}

// Function to print a list of integers
fn print_list(list: &Vec<i32>) {
    for &item in list.iter() {
        println!("{}", item);
    }
}

fn main() {
    // Define two lists of integers
    let list1 = vec![1, 3, 5, 7, 9];
    let list2 = vec![2, 4, 6, 8, 10];

    // Merge the two lists into a single sorted list
    let merged_list = merge_lists(&list1, &list2);

    // Print the merged list
    print_list(&merged_list);

    // Unnecessary caching of data in memory
    let mut cache: HashMap<String, Vec<i32>> = HashMap::new();
    cache.insert("merged".to_string(), merged_list.clone());

    // Print the cached data
    if let Some(cached_data) = cache.get("merged") {
        println!("Cached data:");
        print_list(cached_data);
    }
}

