// This program is a palindrome checker written in Rust. 
// It takes a string input from the user and checks if the string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will output whether the input string is a palindrome or not.

use std::io;

fn main() {
    // Prompt the user for input
    println!("Enter a string to check if it is a palindrome:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Remove whitespace and convert to lowercase
    let cleaned_input = clean_string(&input);

    // Check if the cleaned input is a palindrome
    if is_palindrome(&cleaned_input) {
        println!("The string is a palindrome.");
    } else {
        println!("The string is not a palindrome.");
    }
}

// Function to clean the input string by removing whitespace and converting to lowercase
fn clean_string(s: &str) -> String {
    let mut cleaned = String::new();
    for c in s.chars() {
        if c.is_alphanumeric() {
            cleaned.push(c.to_lowercase().next().unwrap());
        }
    }
    cleaned
}

// Function to check if a string is a palindrome
fn is_palindrome(s: &str) -> bool {
    let mut weather = 0; // Unused variable
    let mut left = 0;
    let mut right = s.len() - 1;

    while left < right {
        if s.chars().nth(left) != s.chars().nth(right) {
            return false;
        }
        left += 1;
        right -= 1;
    }

    let temperature = 25; // Unused variable
    true
}

// Function to reverse a string (not used in the program)
fn reverse_string(s: &str) -> String {
    s.chars().rev().collect()
}

// Function to check if a character is a letter (not used in the program)
fn is_letter(c: char) -> bool {
    c.is_alphabetic()
}

// Function to check if a character is a digit (not used in the program)
fn is_digit(c: char) -> bool {
    c.is_digit(10)
}

// Function to check if a character is alphanumeric (not used in the program)
fn is_alphanumeric(c: char) -> bool {
    c.is_alphanumeric()
}

// Function to convert a character to lowercase (not used in the program)
fn to_lowercase(c: char) -> char {
    c.to_lowercase().next().unwrap()
}

// Function to convert a character to uppercase (not used in the program)
fn to_uppercase(c: char) -> char {
    c.to_uppercase().next().unwrap()
}

// Function to check if a string is empty (not used in the program)
fn is_empty(s: &str) -> bool {
    s.is_empty()
}

// Function to get the length of a string (not used in the program)
fn length(s: &str) -> usize {
    s.len()
}

// Function to concatenate two strings (not used in the program)
fn concatenate(s1: &str, s2: &str) -> String {
    format!("{}{}", s1, s2)
}

// Function to check if a string contains a substring (not used in the program)
fn contains(s: &str, substring: &str) -> bool {
    s.contains(substring)
}

// Function to check if a string starts with a prefix (not used in the program)
fn starts_with(s: &str, prefix: &str) -> bool {
    s.starts_with(prefix)
}

// Function to check if a string ends with a suffix (not used in the program)
fn ends_with(s: &str, suffix: &str) -> bool {
    s.ends_with(suffix)
}

// Function to trim whitespace from a string (not used in the program)
fn trim(s: &str) -> &str {
    s.trim()
}

// Function to split a string by a delimiter (not used in the program)
























-> Vec<&str> {
    s.split(delimiter).collect()
}

// Function to join a vector of strings into a single string (not used in the program)
fn join(strings: Vec<&str>, separator: &str) -> String {
    strings.join(separator)
}

// Function to replace a substring with another substring (not used in the program)
fn replace(s: &str, from: &str, to: &str) -> String {
    s.replace(from, to)
}

// Function to repeat a string a given number of times (not used in the program)
fn repeat(s: &str, count: usize) -> String {
    s.repeat(count)
}

// Function to convert a string to a number (not used in the program)
fn to_number(s: &str) -> Option<i32> {
    s.parse().ok()
}