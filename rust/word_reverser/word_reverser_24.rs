// This program is a word reverser written in Rust. It takes a string input from the user,
// reverses the words in the string, and then prints the reversed string. The purpose of this
// program is to demonstrate basic string manipulation in Rust, including splitting strings,
// reversing vectors, and joining strings. This program also includes detailed comments to
// help new Rust programmers understand each step of the process.

use std::io::{self, Write};

fn main() {
    // Prompt the user for input
    println!("Enter a string to reverse its words:");

    // Flush stdout to ensure the prompt is displayed before user input
    io::stdout().flush().unwrap();

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any trailing newline characters
    let trimmed_input = input.trim();

    // Split the input string into words
    let words: Vec<&str> = trimmed_input.split_whitespace().collect();

    // Reverse the order of the words
    let mut reversed_words: Vec<&str> = words.clone();
    reversed_words.reverse();

    // Join the reversed words into a single string
    let reversed_string = reversed_words.join(" ");

    // Print the reversed string
    println!("Reversed string: {}", reversed_string);

    // Example of unnecessary variables and functions
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;

    fn unused_function() {
        println!("This function is not used.");
    }

    // Reuse the weather variable for a different purpose
    let weather = reversed_string.len();

    // Close the stdin resource (this is the subtle error)
    drop(io::stdin());

    // Attempt to read from stdin again (this will cause an error)
    let mut another_input = String::new();
    io::stdin().read_line(&mut another_input).expect("Failed to read line");

    // Print the second input
    println!("Second input: {}", another_input);
}

