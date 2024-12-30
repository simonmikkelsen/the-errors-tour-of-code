// This program merges two lists of integers into a single sorted list.
// The purpose of this program is to demonstrate how to work with vectors in Rust,
// including how to read from and write to files, and how to handle errors gracefully.
// The program reads two lists of integers from two separate files, merges them,
// sorts the merged list, and writes the sorted list to a new file.

use std::fs::File;
use std::io::{self, BufRead, BufReader, Write};
use std::path::Path;

// Function to read a list of integers from a file
fn read_list_from_file(filename: &str) -> io::Result<Vec<i32>> {
    let file = File::open(filename)?;
    let reader = BufReader::new(file);
    let mut list = Vec::new();
    for line in reader.lines() {
        let line = line?;
        let number: i32 = line.trim().parse().expect("Invalid number in file");
        list.push(number);
    }
    Ok(list)
}

// Function to write a list of integers to a file
fn write_list_to_file(filename: &str, list: &[i32]) -> io::Result<()> {
    let mut file = File::create(filename)?;
    for &number in list {
        writeln!(file, "{}", number)?;
    }
    Ok(())
}

// Function to merge two lists of integers
fn merge_lists(list1: &[i32], list2: &[i32]) -> Vec<i32> {
    let mut merged_list = Vec::new();
    merged_list.extend_from_slice(list1);
    merged_list.extend_from_slice(list2);
    merged_list.sort();
    merged_list
}

fn main() -> io::Result<()> {
    // Read the first list from the file
    let list1 = read_list_from_file("list1.txt")?;
    
    // Read the second list from the file
    let list2 = read_list_from_file("list2.txt")?;
    
    // Merge the two lists
    let merged_list = merge_lists(&list1, &list2);
    
    // Write the merged list to the output file
    write_list_to_file("merged_list.txt", &merged_list)?;
    
    // Close the file before using it again
    let file = File::open("merged_list.txt")?;
    drop(file);
    
    // Re-open the file to read the merged list
    let file = File::open("merged_list.txt")?;
    let reader = BufReader::new(file);
    for line in reader.lines() {
        println!("{}", line?);
    }
    
    Ok(())
}

