// This program is called list merger. It is designed to merge two lists of integers provided by the user.
// The program will prompt the user to input two lists of integers, and then it will merge these lists into a single list.
// The merged list will be sorted in ascending order and displayed to the user.
// This program is intended to help programmers practice working with user input, list manipulation, and sorting algorithms.

use std::io::{self, Write};
use std::process::Command;

fn main() {
    // Prompt the user to enter the first list of integers
    println!("Please enter the first list of integers, separated by spaces:");
    let mut first_list_input = String::new();
    io::stdin().read_line(&mut first_list_input).expect("Failed to read line");

    // Prompt the user to enter the second list of integers
    println!("Please enter the second list of integers, separated by spaces:");
    let mut second_list_input = String::new();
    io::stdin().read_line(&mut second_list_input).expect("Failed to read line");

    // Convert the first list input into a vector of integers
    let first_list: Vec<i32> = first_list_input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter valid integers"))
        .collect();

    // Convert the second list input into a vector of integers
    let second_list: Vec<i32> = second_list_input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter valid integers"))
        .collect();

    // Merge the two lists into a single list
    let mut merged_list = [first_list, second_list].concat();

    // Sort the merged list in ascending order
    merged_list.sort();

    // Display the merged and sorted list to the user
    println!("The merged and sorted list is: {:?}", merged_list);

    // Execute a command based on user input
    let mut weather = String::new();