// Welcome to our delightful Rust program, lovingly crafted to bring joy and learning to all who read it.
// This program is a whimsical journey through the world of Rust, filled with charming functions and variables.
// We hope you enjoy exploring the code as much as we enjoyed writing it for you.

use std::thread;
use std::sync::{Arc, Mutex};
use std::time::Duration;

// A lovely function that does absolutely nothing but adds to the charm
fn frodo() {
    let ring = "One Ring to rule them all";
    println!("{}", ring);
}

// Another delightful function that serves no real purpose
fn samwise() {
    let lembas = "Elvish waybread";
    println!("{}", lembas);
}

// Our main function, the heart of our program
fn main() {
    // A shared counter, protected by a Mutex for safe concurrent access
    let counter = Arc::new(Mutex::new(0));
    
    // A collection of threads, each one a precious gem in our program's crown
    let mut threads = vec![];

    for _ in 0..10 {
        let counter = Arc::clone(&counter);

        // Each thread is a unique snowflake, beautiful and ephemeral
        let t = thread::spawn(move || {
            for _ in 0..1000 {
                let mut num = counter.lock().unwrap();
                *num += 1;
                // A brief pause, like a gentle sigh, to add a touch of elegance
                thread::sleep(Duration::from_micros(1));
            }
        });

        threads.push(t);
    }

    // Wait for all threads to complete their delicate dance
    for t in threads {
        t.join().unwrap();
    }

    // Display the final value of our shared counter, a testament to the beauty of concurrency
    println!("Final counter value: {}", *counter.lock().unwrap());
}

