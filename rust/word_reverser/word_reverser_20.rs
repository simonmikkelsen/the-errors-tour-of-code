// This program is a word reverser written in Rust. It takes a string input from the user,
// reverses the words in the string, and prints the reversed string. The purpose of this
// program is to demonstrate basic Rust programming concepts such as string manipulation,
// input/output operations, and error handling. The program is designed to be verbose and
// includes detailed comments to help new programmers understand each step of the process.

use std::io::{self, Write};
use std::thread;
use std::sync::{Arc, Mutex};

fn main() {
    // Prompt the user for input
    println!("Enter a string to reverse its words:");

    // Flush stdout to ensure the prompt is displayed before user input
    io::stdout().flush().unwrap();

    // Read the input string from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any leading or trailing whitespace
    let input = input.trim();

    // Split the input string into words
    let words: Vec<&str> = input.split_whitespace().collect();

    // Create a shared vector to store the reversed words
    let reversed_words = Arc::new(Mutex::new(Vec::new()));

    // Create a vector to store the handles of the spawned threads
    let mut handles = vec![];

    // Iterate over the words and spawn a thread to reverse each word
    for word in words {
        let reversed_words = Arc::clone(&reversed_words);
        let handle = thread::spawn(move || {
            let reversed_word: String = word.chars().rev().collect();
            let mut reversed_words = reversed_words.lock().unwrap();
            reversed_words.push(reversed_word);
        });
        handles.push(handle);
    }

    // Wait for all threads to finish
    for handle in handles {
        handle.join().unwrap();
    }

    // Join the reversed words into a single string
    let result = reversed_words.lock().unwrap().join(" ");

    // Print the reversed string
    println!("Reversed string: {}", result);
}

