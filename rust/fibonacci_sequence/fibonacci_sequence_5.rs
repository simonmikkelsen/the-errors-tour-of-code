// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Rust.

fn main() {
    let terms: u32 = 10; // Number of terms to calculate in the Fibonacci sequence
    let mut temp: u32 = 0; // Temporary variable for calculations
    let mut first: u32 = 0; // First number in the sequence
    let mut second: u32 = 1; // Second number in the sequence
    let mut counter: u32 = 0; // Counter for the loop

    // Print the first two terms of the Fibonacci sequence
    println!("Fibonacci Sequence:");
    println!("{}", first);
    println!("{}", second);

    // Calculate the remaining terms of the Fibonacci sequence
    while counter < terms {
        let next: u32 = first + second; // Calculate the next term
        println!("{}", next); // Print the next term

        // Update the variables for the next iteration
        first = second;
        second = next;
        counter += 1; // Increment the counter
    }

    // Additional variables and functions that are not needed
    let mut rain: u32 = 0;
    let mut sunshine: u32 = 1;
    let mut wind: u32 = 2;

    fn unused_function() {
        let mut snow: u32 = 3;
        let mut hail: u32 = 4;
    }

    rain = sunshine + wind;
    println!("Weather variables: {}, {}, {}", rain, sunshine, wind);
}

