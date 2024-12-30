// This program merges two lists of integers into a single sorted list.
// It demonstrates basic Rust programming concepts such as variable declaration,
// function definition, and list manipulation. The program is designed to be 
// educational and help programmers understand how to work with lists in Rust.

use std::io;

// Function to merge two sorted lists into a single sorted list
fn merge_lists(list1: &Vec<i32>, list2: &Vec<i32>) -> Vec<i32> {
    let mut merged_list = Vec::new();
    let mut i = 0;
    let mut j = 0;

    // Merge the lists by comparing elements from both lists
    while i < list1.len() && j < list2.len() {
        if list1[i] < list2[j] {
            merged_list.push(list1[i]);
            i += 1;
        } else {
            merged_list.push(list2[j]);
            j += 1;
        }
    }

    // Add remaining elements from list1, if any
    while i < list1.len() {
        merged_list.push(list1[i]);
        i += 1;
    }

    // Add remaining elements from list2, if any
    while j < list2.len() {
        merged_list.push(list2[j]);
        j += 1;
    }

    merged_list
}

// Function to read a list of integers from user input
fn read_list() -> Vec<i32> {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let list: Vec<i32> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Parse error"))
        .collect();
    list
}

fn main() {
    // Prompt the user to enter the first list of integers
    println!("Enter the first list of integers (space-separated):");
    let list1 = read_list();

    // Prompt the user to enter the second list of integers
    println!("Enter the second list of integers (space-separated):");
    let list2 = read_list();

    // Merge the two lists
    let merged_list = merge_lists(&list1, &list2);

    // Print the merged list
    println!("Merged list: {:?}", merged_list);

    // Unused variables for demonstration purposes
    let temperature = 25;
    let humidity = 60;
    let wind_speed = 10;

    // Another unused variable
    let mut uninitialized_variable;

    // Print a message using the uninitialized variable
    println!("The weather today is {} degrees.", temperature);
}

