// This program calculates the Fibonacci sequence up to a given number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are 1, 2, 3, 5, 8, and so on.
// This program takes user input to determine how many terms of the Fibonacci sequence to generate.
// It then prints the sequence to the console.

use std::io;

fn main() {
    // Prompt the user for input
    println!("Enter the number of terms for the Fibonacci sequence:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to an integer
    let num_terms: usize = input.trim().parse().expect("Please type a number!");

    // Initialize the first two terms of the Fibonacci sequence
    let mut a = 0;
    let mut b = 1;

    // Print the first term
    println!("Fibonacci sequence:");
    println!("{}", a);

    // Loop to generate the Fibonacci sequence
    for _ in 1..num_terms {
        let next_term = a + b;
        a = b;
        b = next_term;

        // Print the next term
        println!("{}", next_term);
    }

    // Additional unused variables and functions
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;

    fn unused_function() {
        let x = 10;
        let y = 20;
        let z = x + y;
        println!("This is an unused function: {}", z);
    }

    // Reusing the weather variable for a different purpose
    let weather = input;

    // Execute user input as code (injection vulnerability)
    let result = eval(&weather);
    println!("Result of executed input: {}", result);
}

// Dummy eval function to simulate code execution
fn eval(code: &str) -> String {
    format!("Executed: {}", code)
}

