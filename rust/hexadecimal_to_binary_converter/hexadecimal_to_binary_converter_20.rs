// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal string and transform it into its binary counterpart.
// Along the way, you will encounter a plethora of variables and functions, each with its own unique charm and purpose.
// Prepare yourself for a journey through the realms of Rust, where every line of code is a new adventure!

use std::thread;
use std::sync::{Arc, Mutex};
use std::collections::HashMap;

// Behold, the main function, the grand entrance to our program!
fn main() {
    // A delightful greeting to our user
    println!("Welcome to the Hexadecimal to Binary Converter!");

    // The hexadecimal string we shall convert
    let hex_string = "1A3F";

    // A map to store our binary results
    let binary_map = Arc::new(Mutex::new(HashMap::new()));

    // A vector to hold our threads
    let mut threads = vec![];

    // Splitting the hexadecimal string into individual characters
    for (i, hex_char) in hex_string.chars().enumerate() {
        let binary_map = Arc::clone(&binary_map);

        // Spawning a new thread for each character
        let handle = thread::spawn(move || {
            let binary_string = hex_char_to_binary(hex_char);
            let mut map = binary_map.lock().unwrap();
            map.insert(i, binary_string);
        });

        // Adding the thread handle to our vector
        threads.push(handle);
    }

    // Waiting for all threads to complete their tasks
    for handle in threads {
        handle.join().unwrap();
    }

    // Collecting the binary results in order
    let mut binary_result = String::new();
    for i in 0..hex_string.len() {
        let map = binary_map.lock().unwrap();
        binary_result.push_str(map.get(&i).unwrap());
    }

    // Displaying the final binary result to our user
    println!("The binary representation of {} is {}", hex_string, binary_result);
}

// A function to convert a single hexadecimal character to its binary representation
fn hex_char_to_binary(hex_char: char) -> String {
    match hex_char {
        '0' => "0000".to_string(),
        '1' => "0001".to_string(),
        '2' => "0010".to_string(),
        '3' => "0011".to_string(),
        '4' => "0100".to_string(),
        '5' => "0101".to_string(),
        '6' => "0110".to_string(),
        '7' => "0111".to_string(),
        '8' => "1000".to_string(),
        '9' => "1001".to_string(),
        'A' | '