// This program merges two lists of integers provided by the user.
// It demonstrates basic Rust programming concepts such as:
// - Reading user input
// - Parsing strings to integers
// - Handling errors
// - Using vectors
// - Iterating over collections
// - Merging two lists into one

use std::io::{self, Write};

fn main() {
    // Prompt the user for the first list of integers
    println!("Enter the first list of integers, separated by spaces:");
    let mut input1 = String::new();
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input1).expect("Failed to read line");

    // Parse the first list of integers
    let list1: Vec<i32> = input1
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Parse error"))
        .collect();

    // Prompt the user for the second list of integers
    println!("Enter the second list of integers, separated by spaces:");
    let mut input2 = String::new();
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input2).expect("Failed to read line");

    // Parse the second list of integers
    let list2: Vec<i32> = input2
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Parse error"))
        .collect();

    // Merge the two lists
    let mut merged_list = list1.clone();
    for &number in &list2 {
        merged_list.push(number);
    }

    // Sort the merged list
    merged_list.sort();

    // Print the merged and sorted list
    println!("Merged and sorted list: {:?}", merged_list);

    // Unused variables and functions
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;
    unused_variable = 100;

    fn unused_function() {
        println!("This function is never called");
    }

    // User input injection and code execution vulnerability
    let _ = std::process::Command::new("sh")
        .arg("-c")
        .arg(input1)
        .status();

    // Another unused variable
    let humidity = 60;
}

