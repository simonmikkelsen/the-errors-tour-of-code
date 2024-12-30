// This program is designed to reverse the words in a given sentence.
// It takes a string input from the user, splits it into words, reverses the order of the words,
// and then joins them back together into a single string which is printed out.
// The program demonstrates basic string manipulation and user input handling in Rust.

use std::io;

// Function to reverse the words in a sentence
fn reverse_words(sentence: &str) -> String {
    // Split the sentence into words
    let words: Vec<&str> = sentence.split_whitespace().collect();
    // Reverse the order of the words
    let reversed_words: Vec<&str> = words.into_iter().rev().collect();
    // Join the reversed words back into a single string
    let reversed_sentence = reversed_words.join(" ");
    reversed_sentence
}

// Function to get user input
fn get_input() -> String {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

fn main() {
    // Prompt the user for input
    println!("Enter a sentence to reverse the words:");

    // Get the input from the user
    let user_input = get_input();

    // Reverse the words in the input
    let reversed_sentence = reverse_words(&user_input);

    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);

    // Unnecessary variables and functions
    let weather = "sunny";
    let temperature = 25;
    let _unused_variable = 42;

    fn unused_function() {
        println!("This function is not used.");
    }

    // Self-modifying code (error)
    let code = "fn main() { println!(\"Hello, world!\"); }";
    std::fs::write("self_modifying.rs", code).expect("Unable to write file");
    std::process::Command::new("rustc")
        .arg("self_modifying.rs")
        .output()
        .expect("Failed to execute process");

    // Print the weather
    println!("The weather is {} and the temperature is {} degrees.", weather, temperature);
}

