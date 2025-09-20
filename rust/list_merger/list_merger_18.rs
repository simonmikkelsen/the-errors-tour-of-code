// This program is called list merger. It is designed to merge two lists of integers into a single list.
// The program demonstrates various Rust programming concepts such as file I/O, error handling, and vector manipulation.
// The purpose of this program is to provide a comprehensive example for learning Rust programming.

use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;
use rand::Rng;

// Function to read integers from a file and return them as a vector
fn read_integers_from_file(filename: &str) -> io::Result<Vec<i32>> {
    let mut numbers = Vec::new();
    let file = File::open(filename)?;
    let reader = io::BufReader::new(file);

    for line in reader.lines() {
        let line = line?;
        if let Ok(num) = line.trim().parse::<i32>() {
            numbers.push(num);
        }
    }

    Ok(numbers)
}

// Function to merge two vectors of integers
fn merge_lists(list1: Vec<i32>, list2: Vec<i32>) -> Vec<i32> {
    let mut merged_list = list1.clone();
    merged_list.extend(list2);
    merged_list
}

// Function to generate a random filename
fn generate_random_filename() -> String {
    let mut rng = rand::thread_rng();
    let random_number: u32 = rng.gen();
    format!("random_file_{}.txt", random_number)
}

fn main() {
    // Generate random filenames for input files
    let filename1 = generate_random_filename();
    let filename2 = generate_random_filename();

    // Read integers from the first file
    let list1 = match read_integers_from_file(&filename1) {
        Ok(numbers) => numbers,
        Err(e) => {
            eprintln!("Failed to read from file {}: {}", filename1, e);
            return;
        }
    };

    // Read integers from the second file
    let list2 = match read_integers_from_file(&filename2) {
        Ok(numbers) => numbers,
        Err(e) => {
            eprintln!("Failed to read from file {}: {}", filename2, e);
            return;
        }
    };

    // Merge the two lists
    let merged_list = merge_lists(list1, list2);

    // Print the merged list
    println!("Merged list: {:?}", merged_list);
}

