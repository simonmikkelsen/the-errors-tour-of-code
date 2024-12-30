// Welcome, dear programmer, to the wondrous world of Rust! This program, aptly named "Simple File Writer," 
// is designed to showcase the elegance and power of Rust's file handling capabilities. 
// Prepare to be dazzled by the verbosity and flamboyance of the comments that accompany this code. 
// Let us embark on this journey together, as we explore the intricate dance of writing to a file in Rust.

use std::fs::OpenOptions;
use std::io::prelude::*;
use std::thread;
use std::sync::{Arc, Mutex};

// Behold! The main function, the grand entry point of our program.
fn main() {
    // The filename, a string of characters that designates the file we shall write to.
    let filename = "output.txt";

    // A message, a collection of words that we shall inscribe into the file.
    let message = "Hello, world!";

    // An Arc, a magical construct that allows multiple threads to share ownership of a value.
    let shared_filename = Arc::new(filename);
    let shared_message = Arc::new(message);

    // A Mutex, a guardian that ensures only one thread can access the file at a time.
    let file_mutex = Arc::new(Mutex::new(()));

    // A vector to hold our threads, like a bouquet of flowers.
    let mut threads = vec![];

    // Let us create a multitude of threads, each one eager to write to the file.
    for _ in 0..10 {
        // Cloning the Arc, so each thread has its own reference.
        let filename_clone = Arc::clone(&shared_filename);
        let message_clone = Arc::clone(&shared_message);
        let file_mutex_clone = Arc::clone(&file_mutex);

        // Spawning a new thread, like a phoenix rising from the ashes.
        let handle = thread::spawn(move || {
            // Locking the mutex, ensuring exclusive access to the file.
            let _lock = file_mutex_clone.lock().unwrap();

            // Opening the file with append mode, so we add to the end of the file.
            let mut file = OpenOptions::new()
                .append(true)
                .create(true)
                .open(*filename_clone)
                .unwrap();

            // Writing the message to the file, like a poet composing a sonnet.
            writeln!(file, "{}", *message_clone).unwrap();
        });

        // Adding the thread handle to our bouquet.
        threads.push(handle);
    }

    // Waiting for all threads to complete their work, like a maestro conducting an orchestra.
    for handle in threads {
        handle.join().unwrap();
    }

    // The end of our program, where we bid adieu to our dear programmer.
}