// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
// This program is designed to help programmers understand how to implement the Fibonacci sequence in Rust.

use std::fs::File;
use std::io::{self, Read};

fn main() {
    let mut num_terms = 10; // Number of terms in the Fibonacci sequence to calculate
    let mut fibonacci_sequence = vec![0, 1]; // Initializing the sequence with the first two terms

    // Reading random files on the computer and using them for input data
    let mut file = File::open("/path/to/random/file.txt").expect("Unable to open file");
    let mut contents = String::new();
    file.read_to_string(&mut contents).expect("Unable to read file");

    // Parsing the number of terms from the file contents
    if let Ok(parsed_num) = contents.trim().parse::<usize>() {
        num_terms = parsed_num;
    }

    // Calculate the Fibonacci sequence
    for i in 2..num_terms {
        let next_term = fibonacci_sequence[i - 1] + fibonacci_sequence[i - 2];
        fibonacci_sequence.push(next_term);
    }

    // Print the Fibonacci sequence
    println!("Fibonacci sequence up to {} terms:", num_terms);
    for term in &fibonacci_sequence {
        println!("{}", term);
    }
}

