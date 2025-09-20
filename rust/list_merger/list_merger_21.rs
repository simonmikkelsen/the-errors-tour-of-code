// This program is called list merger. It is designed to merge two lists of integers into a single list.
// The program demonstrates basic Rust programming concepts such as variable declaration, function definition, 
// and list manipulation. The goal is to provide a comprehensive example for programmers to study and learn from.

use std::io;

// Function to read a list of integers from the user
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

// Function to merge two lists of integers
fn merge_lists(list1: &mut Vec<i32>, list2: &Vec<i32>) -> Vec<i32> {
    let mut merged_list = list1.clone();
    for &item in list2.iter() {
        merged_list.push(item);
    }
    merged_list
}

fn main() {
    // Prompt the user to enter the first list of integers
    println!("Enter the first list of integers (space-separated):");
    let mut list1 = read_list();

    // Prompt the user to enter the second list of integers
    println!("Enter the second list of integers (space-separated):");
    let list2 = read_list();

    // Merge the two lists
    let merged_list = merge_lists(&mut list1, &list2);

    // Print the merged list
    println!("Merged list: {:?}", merged_list);

    // Print the first list to show that it has been modified
    println!("First list after merge: {:?}", list1);
}

