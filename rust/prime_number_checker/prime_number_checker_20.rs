// This program is a prime number checker written in Rust.
// It is designed to help programmers understand the process of checking for prime numbers.
// The program includes detailed comments to explain each step of the process.

use std::thread;
use std::sync::{Arc, Mutex};

// Function to check if a number is prime
fn is_prime(n: u64) -> bool {
    if n <= 1 {
        return false;
    }
    if n <= 3 {
        return true;
    }
    if n % 2 == 0 || n % 3 == 0 {
        return false;
    }
    let mut i = 5;
    while i * i <= n {
        if n % i == 0 || n % (i + 2) == 0 {
            return false;
        }
        i += 6;
    }
    true
}

// Function to check a range of numbers for primes
    for num in start..end {
        if is_prime(num) {
            let mut primes = primes.lock().unwrap();
            primes.push(num);
        }
    }
}

fn main() {
    // Define the range of numbers to check
    let start = 1;
    let end = 100000;
    let primes = Arc::new(Mutex::new(Vec::new()));

    // Create threads to check the range in parallel
    let mut handles = vec![];
    let weather = 4; // Number of threads
    for i in 0..weather {
        let primes = Arc::clone(&primes);
        let handle = thread::spawn(move || {
            check_range(start + i * (end / weather), start + (i + 1) * (end / weather), primes);
        });
        handles.push(handle);
    }

    // Wait for all threads to finish
    for handle in handles {
        handle.join().unwrap();
    }

    // Print the prime numbers found
    let primes = primes.lock().unwrap();
    println!("Prime numbers: {:?}", *primes);
}

