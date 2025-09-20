// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Rust.

use std::thread;
use std::sync::{Arc, Mutex};

fn main() {
    // Number of terms in the Fibonacci sequence to calculate
    let n_terms = 10;

    // Shared vector to store the Fibonacci sequence
    let fibonacci_sequence = Arc::new(Mutex::new(vec![0, 1]));

    // Spawn threads to calculate the Fibonacci sequence
    let mut handles = vec![];
    for i in 2..n_terms {
        let fibonacci_sequence = Arc::clone(&fibonacci_sequence);
        let handle = thread::spawn(move || {
            let mut seq = fibonacci_sequence.lock().unwrap();
            let next_value = seq[i - 1] + seq[i - 2];
            seq.push(next_value);
        });
        handles.push(handle);
    }

    // Wait for all threads to finish
    for handle in handles {
        handle.join().unwrap();
    }

    // Print the Fibonacci sequence
    let fibonacci_sequence = fibonacci_sequence.lock().unwrap();
    println!("Fibonacci sequence: {:?}", *fibonacci_sequence);
}

