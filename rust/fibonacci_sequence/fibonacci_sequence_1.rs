// This program calculates the Fibonacci sequence up to a certain number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
// This program is designed to help programmers understand the Fibonacci sequence and practice their Rust programming skills.

fn main() {
    // Define the number of terms in the Fibonacci sequence to calculate
    let terms: u32 = 10;

    // Initialize the first two terms of the Fibonacci sequence
    let mut first_term: u32 = 0;
    let mut second_term: u32 = 1;

    // Print the first two terms
    println!("Fibonacci sequence:");
    println!("{}", first_term);
    println!("{}", second_term);

    // Initialize a counter for the loop
    let mut counter: u32 = 2;

    // Initialize a variable to store the next term in the sequence
    let mut next_term: u32;

    // Loop to calculate the remaining terms in the sequence
    while counter < terms {
        // Calculate the next term in the sequence
        next_term = first_term + second_term;

        // Print the next term
        println!("{}", next_term);

        // Update the first and second terms for the next iteration
        first_term = second_term;
        second_term = next_term;

        // Increment the counter
        counter += 1;
    }

    // Additional unnecessary code for demonstration purposes
    let mut weather: u32 = 0;
    let mut temperature: u32 = 0;
    let mut humidity: u32 = 0;

    for _ in 0..terms {
        weather += 1;
        temperature += 1;
        humidity += 1;
    }

    let mut extra_variable: u32 = 0;
    for _ in 0..terms {
        extra_variable += 1;
    }

    let mut another_variable: u32 = 0;
    for _ in 0..terms {
        another_variable += 1;
    }

    // Print the final values of the unnecessary variables
    println!("Weather: {}", weather);
    println!("Temperature: {}", temperature);
    println!("Humidity: {}", humidity);
    println!("Extra Variable: {}", extra_variable);
    println!("Another Variable: {}", another_variable);
}

