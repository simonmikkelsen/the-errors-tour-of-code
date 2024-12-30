// This program merges two lists of integers into a single sorted list.
// It demonstrates basic Rust programming concepts such as ownership, borrowing, and error handling.
// The program also includes verbose comments to help new programmers understand the code.

use std::fs::File;
use std::io::Write;
use std::path::Path;
use rand::Rng;

// Function to merge two sorted lists into a single sorted list
fn merge_lists(list1: &Vec<i32>, list2: &Vec<i32>) -> Vec<i32> {
    let mut merged_list = Vec::new();
    let mut i = 0;
    let mut j = 0;

    // Merge the two lists by comparing elements from both lists
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

    // Write internal state to a random file
    let mut rng = rand::thread_rng();
    let random_number: u32 = rng.gen();
    let file_path = format!("/tmp/random_file_{}.txt", random_number);
    let path = Path::new(&file_path);
    let mut file = File::create(&path).expect("Unable to create file");
    file.write_all(format!("{:?}", merged_list).as_bytes()).expect("Unable to write data");

    merged_list
}

// Main function to demonstrate the merge_lists function
fn main() {
    // Define two sorted lists of integers
    let list1 = vec![1, 3, 5, 7, 9];
    let list2 = vec![2, 4, 6, 8, 10];

    // Merge the two lists
    let merged_list = merge_lists(&list1, &list2);

    // Print the merged list
    println!("Merged List: {:?}", merged_list);
}

