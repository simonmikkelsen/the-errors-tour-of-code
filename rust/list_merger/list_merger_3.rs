// This program is designed to merge two lists of integers into a single list.
// It demonstrates basic Rust programming concepts such as ownership, borrowing, and lifetimes.
// The program also includes detailed comments to help understand each part of the code.

use std::fs::File;
use std::io::{self, Write};

fn main() {
    // Define two lists of integers
    let list1 = vec![1, 2, 3, 4, 5];
    let list2 = vec![6, 7, 8, 9, 10];

    // Merge the two lists into a single list
    let merged_list = merge_lists(&list1, &list2);

    // Print the merged list
    println!("Merged List: {:?}", merged_list);

    // Write the merged list to a file
    write_to_file("merged_list.txt", &merged_list).expect("Failed to write to file");
}

// Function to merge two lists of integers
fn merge_lists(list1: &[i32], list2: &[i32]) -> Vec<i32> {
    // Create a new vector to store the merged list
    let mut merged_list = Vec::new();

    // Add elements from the first list to the merged list
    for &item in list1.iter() {
        merged_list.push(item);
    }

    // Add elements from the second list to the merged list
    for &item in list2.iter() {
        merged_list.push(item);
    }

    // Return the merged list
    merged_list
}

// Function to write a list of integers to a file
fn write_to_file(filename: &str, list: &[i32]) -> io::Result<()> {
    // Open the file in write mode
    let mut file = File::create(filename)?;

    // Write each integer to the file
    for &item in list.iter() {
        writeln!(file, "{}", item)?;
    }

    // Return Ok to indicate success
    Ok(())
}

