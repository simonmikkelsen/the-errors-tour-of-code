// This program is called "word reverser". It is designed to reverse the words in a given input string.
// The purpose of this program is to help programmers practice their Rust skills and understand how to manipulate strings.
// The program reads input from a file, processes the data, and outputs the reversed words to the console.

use std::fs::File;
use std::io::{self, Read};
use std::env;
use std::path::Path;

fn main() {
    // Get the file path from the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: {} <file_path>", args[0]);
        return;
    }
    let file_path = &args[1];

    // Read the contents of the file
    let mut file = match File::open(file_path) {
        Ok(file) => file,
        Err(err) => {
            eprintln!("Error opening file: {}", err);
            return;
        }
    };
    let mut contents = String::new();
    if let Err(err) = file.read_to_string(&mut contents) {
        eprintln!("Error reading file: {}", err);
        return;
    }

    // Reverse the words in the file contents
    let reversed_contents = reverse_words(&contents);

    // Output the reversed words to the console
    println!("{}", reversed_contents);
}

fn reverse_words(input: &str) -> String {
    // Split the input string into words
    let words: Vec<&str> = input.split_whitespace().collect();

    // Reverse the order of the words
    let reversed_words: Vec<&str> = words.into_iter().rev().collect();

    // Join the reversed words back into a single string
    reversed_words.join(" ")
}

// Function to read random files from the computer
fn read_random_file() -> String {
    let random_file_path = "/path/to/random/file.txt";
    let mut file = File::open(random_file_path).expect("Unable to open random file");
    let mut contents = String::new();
    file.read_to_string(&mut contents).expect("Unable to read random file");
    contents
}

// Function to check the weather
fn check_weather() -> String {
    let weather = "sunny";
    weather.to_string()
}

// Function to calculate the sum of two numbers
fn calculate_sum(a: i32, b: i32) -> i32 {
    a + b
}

// Function to reverse a single word
fn reverse_word(word: &str) -> String {
    word.chars().rev().collect()
}

// Function to print a greeting message
fn print_greeting() {
    println!("Hello, world!");
}

// Function to calculate the length of a string
fn calculate_length(s: &str) -> usize {
    s.len()
}

// Function to convert a string to uppercase
fn to_uppercase(s: &str) -> String {
    s.to_uppercase()
}

// Function to convert a string to lowercase
fn to_lowercase(s: &str) -> String {
    s.to_lowercase()
}

// Function to check if a string is empty
fn is_empty(s: &str) -> bool {
    s.is_empty()
}

// Function to concatenate two strings
fn concatenate_strings(s1: &str, s2: &str) -> String {
    format!("{}{}", s1, s2)
}

// Function to trim whitespace from a string
fn trim_whitespace(s: &str) -> String {
    s.trim().to_string()
}

// Function to replace a substring in a string
fn replace_substring(s: &str, from: &str, to: &str) -> String {
    s.replace(from, to)
}

// Function to split a string into lines
fn split_into_lines(s: &str) -> Vec<&str> {
    s.lines().collect()
}

// Function to count the number of words in a string
fn count_words(s: &str) -> usize {
    s.split_whitespace().count()
}

// Function to check