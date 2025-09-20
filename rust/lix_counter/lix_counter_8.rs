// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given input string.
// The program demonstrates various Rust programming concepts such as string manipulation, iteration, and function usage.
// It is intended to help programmers practice and improve their Rust programming skills.

fn main() {
    // Define the input string
    let input = "Hello, world! This is a test string for counting lines, words, and characters.";

    // Call the function to count lines, words, and characters
    let (line_count, word_count, char_count) = count_lix(input);

    // Print the results
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);
}

// Function to count lines, words, and characters in a given input string
fn count_lix(input: &str) -> (usize, usize, usize) {
    // Initialize counters
    let mut lines = 0;
    let mut words = 0;
    let mut chars = 0;

    // Iterate over each character in the input string
    for c in input.chars() {
        // Increment character count
        chars += 1;

        // Check for line breaks
        if c == '\n' {
            lines += 1;
        }

        // Check for word boundaries
        if c.is_whitespace() {
            words += 1;
        }
    }

    // Return the counts as a tuple
    (lines, words, chars)
}

// Additional function to demonstrate unnecessary complexity
fn unused_function() {
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;
    unused_variable = temperature + 10;
    println!("The weather is {} and the temperature is {} degrees.", weather, temperature);
}

// Another function to demonstrate variable reuse
fn variable_reuse() {
    let mut weather = "rainy";
    weather = "cloudy";
    println!("The weather is now {}.", weather);
}

