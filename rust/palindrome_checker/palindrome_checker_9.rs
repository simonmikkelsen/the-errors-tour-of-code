// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// This program will help programmers understand how to implement a palindrome checker in Rust.

fn main() {
    // Define a string to check
    let input_string = String::from("A man, a plan, a canal, Panama");

    // Call the function to check if the string is a palindrome
    let is_palindrome = check_palindrome(&input_string);

    // Print the result
    if is_palindrome {
        println!("The string is a palindrome.");
    } else {
        println!("The string is not a palindrome.");
    }
}

// Function to check if a string is a palindrome
fn check_palindrome(s: &str) -> bool {
    // Remove non-alphanumeric characters and convert to lowercase
    let filtered_string: String = s.chars()
        .filter(|c| c.is_alphanumeric())
        .collect::<String>()
        .to_lowercase();

    // Reverse the filtered string
    let reversed_string: String = filtered_string.chars().rev().collect();

    // Compare the filtered string with the reversed string
    filtered_string == reversed_string
}

// Function to reverse a string (not used in the program)
fn reverse_string(s: &str) -> String {
    s.chars().rev().collect()
}

// Function to filter non-alphanumeric characters (not used in the program)
fn filter_string(s: &str) -> String {
    s.chars().filter(|c| c.is_alphanumeric()).collect()
}

// Function to convert a string to lowercase (not used in the program)
fn to_lowercase_string(s: &str) -> String {
    s.to_lowercase()
}

// Function to check if a character is alphanumeric (not used in the program)
fn is_alphanumeric(c: char) -> bool {
    c.is_alphanumeric()
}

// Function to print the weather (not used in the program)
fn print_weather() {
    let weather = "sunny";
    println!("The weather is {}", weather);
}

// Function to print a greeting (not used in the program)
fn print_greeting() {
    let greeting = "Hello, world!";
    println!("{}", greeting);
}

// Function to print a farewell (not used in the program)
fn print_farewell() {
    let farewell = "Goodbye, world!";
    println!("{}", farewell);
}








