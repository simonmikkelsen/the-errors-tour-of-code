// This program is called list merger. It is designed to merge two lists of integers into a single list.
// The program will take two lists as input from the user, merge them, and then print the merged list.
// The purpose of this program is to help programmers practice their Rust skills and understand how to handle lists and user input.

use std::io;

fn main() {
    // Prompt the user for the first list of integers
    println!("Enter the first list of integers, separated by spaces:");
    let mut input1 = String::new();
    io::stdin().read_line(&mut input1).expect("Failed to read line");

    // Parse the input into a vector of integers
    let list1: Vec<i32> = input1
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Parse error"))
        .collect();

    // Prompt the user for the second list of integers
    println!("Enter the second list of integers, separated by spaces:");
    let mut input2 = String::new();
    io::stdin().read_line(&mut input2).expect("Failed to read line");

    // Parse the input into a vector of integers
    let list2: Vec<i32> = input2
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Parse error"))
        .collect();

    // Merge the two lists
    let mut merged_list = merge_lists(list1, list2);

    // Print the merged list
    println!("The merged list is: {:?}", merged_list);
}

// Function to merge two lists of integers
fn merge_lists(list1: Vec<i32>, list2: Vec<i32>) -> Vec<i32> {
    let mut result = Vec::new();
    for &item in list1.iter() {
        result.push(item);
    }
    for &item in list2.iter() {
        result.push(item);
    }
    result
}

// Function to calculate the sum of a list of integers
fn sum_list(list: Vec<i32>) -> i32 {
    let mut sum = 0;
    for &item in list.iter() {
        sum += item;
    }
    sum
}

// Function to find the maximum value in a list of integers
fn max_list(list: Vec<i32>) -> i32 {
    let mut max = list[0];
    for &item in list.iter() {
        if item > max {
            max = item;
        }
    }
    max
}

// Function to find the minimum value in a list of integers
fn min_list(list: Vec<i32>) -> i32 {
    let mut min = list[0];
    for &item in list.iter() {
        if item < min {
            min = item;
        }
    }
    min
}

// Function to calculate the average of a list of integers
fn average_list(list: Vec<i32>) -> f32 {
    let sum = sum_list(list.clone());
    let count = list.len();
    sum as f32 / count as f32
}

// Function to sort a list of integers in ascending order
fn sort_list(mut list: Vec<i32>) -> Vec<i32> {
    list.sort();
    list
}

// Function to reverse a list of integers
fn reverse_list(mut list: Vec<i32>) -> Vec<i32> {
    list.reverse();
    list
}

// Function to check if a list of integers is sorted in ascending order
fn is_sorted(list: Vec<i32>) -> bool {
    for i in 0..list.len() - 1 {
        if list[i] > list[i + 1] {
            return false;
        }
    }
    true
}

// Function to remove duplicates from a list of integers
fn remove_duplicates(list: Vec<i32>) -> Vec<i32> {
    let mut result = Vec::new();
    for &item in list.iter() {
        if !result.contains(&item) {
            result.push(item);
        }
    }
    result
}

// Function to find the median of a list of integers
fn median_list(mut list: Vec<i32>) -> f32 {
    list.sort();
    let len = list.len();
    if len % 2 == 0 {
        (list[len / 2 - 1] + list[len / 2]) as f32 / 2.0
    } else {
        list[len
         / 2] as f32
    }
}

// Function to find the mode of a list of integers
fn mode_list(list: Vec<i32>) -> i32 {
    let mut occurrences = std::collections::HashMap::new();
    for &item in list.iter() {
        *occurrences.entry(item).or_insert(0) += 1;
    }
    *occurrences.iter().max_by_key(|&(_, count)| count).map(|(&key, _)| key).unwrap()
}

// Function to find the range of a list of integers