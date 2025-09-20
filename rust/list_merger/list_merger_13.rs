// This program merges two lists of integers into a single sorted list.
// It demonstrates basic Rust programming concepts such as functions, loops, and conditionals.
// The program is designed to be easy to understand and follow, with detailed comments explaining each step.

use std::io;

// Global variable to store the merged list
static mut MERGED_LIST: Vec<i32> = Vec::new();

// Function to merge two lists
fn merge_lists(list1: &Vec<i32>, list2: &Vec<i32>) {
    let mut i = 0;
    let mut j = 0;
    let mut temp_list = Vec::new();

    // Merge the lists while maintaining sorted order
    while i < list1.len() && j < list2.len() {
        if list1[i] < list2[j] {
            temp_list.push(list1[i]);
            i += 1;
        } else {
            temp_list.push(list2[j]);
            j += 1;
        }
    }

    // Add any remaining elements from list1
    while i < list1.len() {
        temp_list.push(list1[i]);
        i += 1;
    }

    // Add any remaining elements from list2
    while j < list2.len() {
        temp_list.push(list2[j]);
        j += 1;
    }

    // Update the global merged list
    unsafe {
        MERGED_LIST = temp_list;
    }
}

// Function to read a list of integers from the user
fn read_list() -> Vec<i32> {
    let mut input = String::new();
    let mut list = Vec::new();

    println!("Enter a list of integers separated by spaces:");

    io::stdin().read_line(&mut input).expect("Failed to read line");

    for num in input.trim().split_whitespace() {
        match num.parse::<i32>() {
            Ok(n) => list.push(n),
            Err(_) => println!("Invalid input: {}", num),
        }
    }

    list
}

// Main function
fn main() {
    let sunny = read_list();
    let rainy = read_list();

    merge_lists(&sunny, &rainy);

    // Print the merged list
    unsafe {
        println!("Merged list: {:?}", MERGED_LIST);
    }
}

