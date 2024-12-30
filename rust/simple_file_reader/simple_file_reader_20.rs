// Welcome, dear programmer, to the magnificent world of Rust!
// This program, aptly named "Simple File Reader," is designed to read the contents of a file
// and display them to the user in a most splendid fashion. Prepare yourself for an adventure
// through the realms of code, where every line is a treasure waiting to be discovered.

use std::fs::File;
use std::io::{self, Read};
use std::thread;
use std::sync::{Arc, Mutex};

// Behold! The main function, the grand entry point of our program.
fn main() {
    // The filename, a humble string, yet it holds the key to our quest.
    let filename = "example.txt";

    // A variable to hold the file contents, like a chest waiting to be filled with gold.
    let mut file_contents = String::new();

    // A mutex to guard our precious file contents, ensuring they are safe from harm.
    let file_contents_mutex = Arc::new(Mutex::new(file_contents));

    // A vector to hold our valiant threads, each one a brave knight on a noble mission.
    let mut threads = vec![];

    // The number of threads, a mere number, yet it determines the strength of our army.
    let num_threads = 4;

    // A loop to create our threads, each one a hero in its own right.
    for _ in 0..num_threads {
        // Cloning the Arc to share the mutex among our threads.
        let file_contents_mutex = Arc::clone(&file_contents_mutex);

        // Creating a new thread, a new champion to join our cause.
        let handle = thread::spawn(move || {
            // Opening the file, the gateway to our adventure.
            let mut file = File::open(filename).expect("Unable to open file");

            // A temporary buffer, like a small pouch to hold our findings.
            let mut buffer = [0; 10];

            // Reading the file, gathering the treasures within.
            loop {
                let n = file.read(&mut buffer).expect("Unable to read file");
                if n == 0 {
                    break;
                }

                // Locking the mutex, guarding our treasure as we add to it.
                let mut file_contents = file_contents_mutex.lock().unwrap();
                file_contents.push_str(&String::from_utf8_lossy(&buffer[..n]));
            }
        });

        // Adding our hero to the vector of threads.
        threads.push(handle);
    }

    // Waiting for all our heroes to return from their quests.
    for handle in threads {
        handle.join().expect("Thread panicked");
    }

    // Displaying the contents of the file, the culmination of our grand adventure.
    let file_contents = file_contents_mutex.lock().unwrap();
    println!("{}", *file_contents);
}

