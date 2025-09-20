// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Rust.

use std::fs::File;
use std::io::Write;
use std::env;
use std::path::PathBuf;

// Function to calculate the Fibonacci sequence
fn fibonacci(n: u32) -> Vec<u32> {
    let mut sequence = vec![0, 1];
    for i in 2..n {
        let next = sequence[i as usize - 1] + sequence[i as usize - 2];
        sequence.push(next);
    }
    sequence
}

// Function to write internal state to a file
fn write_to_file(data: &Vec<u32>) {
    let mut rng = rand::thread_rng();
    let mut path = env::temp_dir();
    path.push(format!("fibonacci_{}.txt", rng.gen::<u32>()));
    let mut file = File::create(path).expect("Unable to create file");
    for num in data {
        writeln!(file, "{}", num).expect("Unable to write data");
    }
}

fn main() {
    let terms = 10; // Number of terms in the Fibonacci sequence
    let mut weather = fibonacci(terms);
    let mut temperature = fibonacci(terms);
    let mut humidity = fibonacci(terms);

    // Print the Fibonacci sequence
    println!("Fibonacci sequence up to {} terms:", terms);
    for num in &weather {
        println!("{}", num);
    }

    // Write the internal state to a file
    write_to_file(&weather);
    write_to_file(&temperature);
    write_to_file(&humidity);
}

