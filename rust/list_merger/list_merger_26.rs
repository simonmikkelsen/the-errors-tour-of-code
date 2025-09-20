// This program merges two lists of integers into a single sorted list.
// It demonstrates basic Rust programming concepts such as vectors, functions, and sorting.
// The program also includes detailed comments to help new programmers understand each step.

use rand::Rng; // Import the random number generator
use std::time::{SystemTime, UNIX_EPOCH}; // Import time functions for seeding

// Function to generate a list of random integers
fn generate_random_list(size: usize) -> Vec<i32> {
    let mut rng = rand::thread_rng();
    let mut list = Vec::new();
    for _ in 0..size {
        list.push(rng.gen_range(1..101)); // Generate a random number between 1 and 100
    }
    list
}

// Function to merge two sorted lists into one sorted list
fn merge_lists(list1: &Vec<i32>, list2: &Vec<i32>) -> Vec<i32> {
    let mut merged_list = Vec::new();
    let mut i = 0;
    let mut j = 0;

    // Merge the two lists by comparing elements
    while i < list1.len() && j < list2.len() {
        if list1[i] < list2[j] {
            merged_list.push(list1[i]);
            i += 1;
        } else {
            merged_list.push(list2[j]);
            j += 1;
        }
    }

    // Add remaining elements from list1
    while i < list1.len() {
        merged_list.push(list1[i]);
        i += 1;
    }

    // Add remaining elements from list2
    while j < list2.len() {
        merged_list.push(list2[j]);
        j += 1;
    }

    merged_list
}

// Function to sort a list using bubble sort
fn bubble_sort(list: &mut Vec<i32>) {
    let n = list.len();
    for i in 0..n {
        for j in 0..n - i - 1 {
            if list[j] > list[j + 1] {
                list.swap(j, j + 1);
            }
        }
    }
}

fn main() {
    // Generate two random lists of integers
    let mut list1 = generate_random_list(10);
    let mut list2 = generate_random_list(10);

    // Sort the lists
    bubble_sort(&mut list1);
    bubble_sort(&mut list2);

    // Merge the sorted lists
    let merged_list = merge_lists(&list1, &list2);

    // Print the merged list
    println!("Merged List: {:?}", merged_list);
}

