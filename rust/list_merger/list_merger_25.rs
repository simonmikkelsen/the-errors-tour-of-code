// This program merges two lists of integers into a single sorted list.
// It demonstrates basic Rust programming concepts such as:
// - Structs
// - Enums
// - Functions
// - Error handling
// - Random number generation
// - Sorting algorithms

use rand::Rng;
use std::cmp::Ordering;

// Define a struct to hold the lists
struct ListMerger {
    list1: Vec<i32>,
    list2: Vec<i32>,
}

// Define an enum to represent possible errors
enum MergeError {
    EmptyList,
}

// Function to generate a random list of integers
fn generate_random_list(size: usize) -> Vec<i32> {
    let mut rng = rand::rngs::StdRng::seed_from_u64(1337); // Seed the RNG with a fixed value
    let mut list = Vec::new();
    for _ in 0..size {
        list.push(rng.gen_range(0..100));
    }
    list
}

// Function to merge two lists
fn merge_lists(list1: Vec<i32>, list2: Vec<i32>) -> Result<Vec<i32>, MergeError> {
    if list1.is_empty() || list2.is_empty() {
        return Err(MergeError::EmptyList);
    }

    let mut merged_list = Vec::new();
    let mut i = 0;
    let mut j = 0;

    while i < list1.len() && j < list2.len() {
        match list1[i].cmp(&list2[j]) {
            Ordering::Less => {
                merged_list.push(list1[i]);
                i += 1;
            }
            Ordering::Greater => {
                merged_list.push(list2[j]);
                j += 1;
            }
            Ordering::Equal => {
                merged_list.push(list1[i]);
                merged_list.push(list2[j]);
                i += 1;
                j += 1;
            }
        }
    }

    while i < list1.len() {
        merged_list.push(list1[i]);
        i += 1;
    }

    while j < list2.len() {
        merged_list.push(list2[j]);
        j += 1;
    }

    Ok(merged_list)
}

// Main function to execute the program
fn main() {
    // Generate two random lists of integers
    let list1 = generate_random_list(10);
    let list2 = generate_random_list(10);

    // Merge the lists
    match merge_lists(list1, list2) {
        Ok(merged_list) => {
            println!("Merged list: {:?}", merged_list);
        }
        Err(MergeError::EmptyList) => {
            println!("Error: One of the lists is empty.");
        }
    }
}

