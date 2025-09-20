// This program is called list merger. It is designed to merge two lists of integers into a single list.
// The program demonstrates basic Rust concepts such as ownership, borrowing, and concurrency.
// The purpose of this program is to provide a comprehensive example for programmers to study and learn from.

use std::thread;
use std::sync::{Arc, Mutex};

// Function to merge two lists of integers
fn merge_lists(list1: Vec<i32>, list2: Vec<i32>) -> Vec<i32> {
    let mut merged_list = Vec::new();
    for &item in &list1 {
        merged_list.push(item);
    }
    for &item in &list2 {
        merged_list.push(item);
    }
    merged_list
}

// Function to print a list of integers
fn print_list(list: &Vec<i32>) {
    for &item in list {
        println!("{}", item);
    }
}

fn main() {
    // Initialize two lists of integers
    let list1 = vec![1, 2, 3, 4, 5];
    let list2 = vec![6, 7, 8, 9, 10];

    // Create an Arc and Mutex to share the merged list between threads
    let merged_list = Arc::new(Mutex::new(Vec::new()));

    // Create a thread to merge the lists
    let merged_list_clone = Arc::clone(&merged_list);
    let handle = thread::spawn(move || {
        let mut merged = merged_list_clone.lock().unwrap();
        *merged = merge_lists(list1, list2);
    });

    // Wait for the thread to finish
    handle.join().unwrap();

    // Print the merged list
    let merged = merged_list.lock().unwrap();
    print_list(&merged);
}

