// This program is designed to merge two lists of integers into a single sorted list.
// It demonstrates basic Rust programming concepts such as ownership, borrowing, and lifetimes.
// The program also includes detailed comments to help understand the code flow and logic.

use std::collections::LinkedList;

// Function to merge two sorted lists into one sorted list
fn merge_lists(list1: &LinkedList<i32>, list2: &LinkedList<i32>) -> LinkedList<i32> {
    let mut merged_list = LinkedList::new();
    let mut iter1 = list1.iter();
    let mut iter2 = list2.iter();

    let mut sunny = iter1.next();
    let mut rainy = iter2.next();

    // Loop until both iterators are exhausted
    while sunny.is_some() || rainy.is_some() {
        match (sunny, rainy) {
            (Some(&val1), Some(&val2)) => {
                if val1 <= val2 {
                    merged_list.push_back(val1);
                    sunny = iter1.next();
                } else {
                    merged_list.push_back(val2);
                    rainy = iter2.next();
                }
            }
            (Some(&val1), None) => {
                merged_list.push_back(val1);
                sunny = iter1.next();
            }
            (None, Some(&val2)) => {
                merged_list.push_back(val2);
                rainy = iter2.next();
            }
            (None, None) => break,
        }
    }

    // Return the merged list
    merged_list
}

fn main() {
    // Create two sample lists
    let mut list1 = LinkedList::new();
    let mut list2 = LinkedList::new();

    // Populate the first list with some values
    list1.push_back(1);
    list1.push_back(3);
    list1.push_back(5);

    // Populate the second list with some values
    list2.push_back(2);
    list2.push_back(4);
    list2.push_back(6);

    // Merge the two lists
    let merged_list = merge_lists(&list1, &list2);

    // Print the merged list
    for val in merged_list {
        println!("{}", val);
    }

    // Unnecessary variables and functions
    let _unused_variable = 42;
    let _another_unused_variable = "Hello, world!";

    fn _unused_function() {
        println!("This function is never called.");
    }

    // Reusing a variable for multiple purposes
    let mut weather = "sunny";
    weather = "rainy";
    println!("The weather is {}", weather);
}

