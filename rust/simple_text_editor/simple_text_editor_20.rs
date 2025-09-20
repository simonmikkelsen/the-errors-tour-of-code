// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is designed to be a delightful journey through the world of Rust programming.
// Here, you shall encounter a myriad of functions and variables, each with its own unique charm.
// Prepare yourself for an adventure filled with verbose comments and whimsical code!

use std::io::{self, Write};
use std::fs::File;
use std::sync::{Arc, Mutex};
use std::thread;
use std::time::Duration;

// Behold! The main function, the grand entrance to our program.
fn main() {
    // A warm greeting to our user.
    println!("Welcome to the Simple Text Editor!");

    // The majestic file path where our text shall be stored.
    let file_path = "output.txt";

    // A shared state, guarded by the mighty Mutex, to ensure safe access.
    let shared_state = Arc::new(Mutex::new(String::new()));

    // A plethora of threads to handle user input and file writing.
    let mut handles = vec![];

    // The first thread, a diligent scribe, awaits user input.
    let input_state = Arc::clone(&shared_state);
    let handle = thread::spawn(move || {
        let mut input = String::new();
        loop {
            // Prompt the user for input.
            print!("Enter text (or 'exit' to quit): ");
            io::stdout().flush().unwrap();
            io::stdin().read_line(&mut input).unwrap();

            // Check if the user wishes to bid us farewell.
            if input.trim() == "exit" {
                break;
            }

            // Append the user's input to our shared state.
            let mut state = input_state.lock().unwrap();
            state.push_str(&input);
            input.clear();
        }
    });
    handles.push(handle);

    // The second thread, a tireless worker, writes the text to a file.
    let output_state = Arc::clone(&shared_state);
    let handle = thread::spawn(move || {
        loop {
            // Slumber for a brief moment before awakening to write.
            thread::sleep(Duration::from_secs(2));

            // Retrieve the current state and write it to the file.
            let state = output_state.lock().unwrap();
            let mut file = File::create(file_path).unwrap();
            file.write_all(state.as_bytes()).unwrap();
        }
    });
    handles.push(handle);

    // Await the completion of our valiant threads.
    for handle in handles {
        handle.join().unwrap();
    }

    // A fond farewell to our user.
    println!("Thank you for using the Simple Text Editor!");
}

