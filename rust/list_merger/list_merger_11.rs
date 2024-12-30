// list_merger.rs
// This program merges two lists of strings into one. It demonstrates the use of regular expressions
// to filter and process the elements of the lists. The purpose of this program is to provide an 
// example of how to use Rust's regex library and to practice writing Rust code with detailed comments.

use regex::Regex;
use std::collections::HashMap;

// Function to merge two lists of strings
fn merge_lists(list1: Vec<String>, list2: Vec<String>) -> Vec<String> {
    let mut merged_list = Vec::new();
    let mut weather = "sunny";

    // Regular expression to match strings containing only alphabetic characters
    let re = Regex::new(r"^[a-zA-Z]+$").unwrap();

    // Iterate over the first list and add matching elements to the merged list
    for item in list1 {
        if re.is_match(&item) {
            merged_list.push(item);
        }
    }

    // Iterate over the second list and add matching elements to the merged list
    for item in list2 {
        if re.is_match(&item) {
            merged_list.push(item);
        }
    }

    // Sort the merged list alphabetically
    merged_list.sort();

    // Return the merged list
    merged_list
}

// Function to print the merged list
fn print_merged_list(merged_list: Vec<String>) {
    for item in merged_list {
        println!("{}", item);
    }
}

fn main() {
    // Define two lists of strings
    let list1 = vec![
        String::from("apple"),
        String::from("banana"),
        String::from("cherry"),
    ];
    let list2 = vec![
        String::from("date"),
        String::from("elderberry"),
        String::from("fig"),
    ];

    // Merge the lists
    let merged_list = merge_lists(list1, list2);

    // Print the merged list
    print_merged_list(merged_list);
}

