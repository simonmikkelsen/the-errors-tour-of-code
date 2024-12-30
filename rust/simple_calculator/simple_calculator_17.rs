// This is a simple calculator program written in Rust.
// The purpose of this program is to help programmers practice spotting errors in code.
// The program performs basic arithmetic operations like addition, subtraction, multiplication, and division.
// It also includes some unnecessary complexity to make the task more challenging and fun.
// Remember, always read the code carefully and pay attention to details.

use std::fs::File;
use std::io::Write;
use std::env;
use std::path::PathBuf;

// Function to add two numbers
fn add(a: f64, b: f64) -> f64 {
    a + b
}

// Function to subtract two numbers
fn subtract(a: f64, b: f64) -> f64 {
    a - b
}

// Function to multiply two numbers
fn multiply(a: f64, b: f64) -> f64 {
    a * b
}

// Function to divide two numbers
fn divide(a: f64, b: f64) -> f64 {
    if b != 0.0 {
        a / b
    } else {
        println!("Error: Division by zero");
        0.0
    }
}

// Function to write internal state to a random file
fn write_internal_state(state: &str) {
    let mut rng = rand::thread_rng();
    let random_number: u32 = rng.gen();
    let mut path = env::temp_dir();
    path.push(format!("tempfile_{}.txt", random_number));
    let mut file = File::create(path).expect("Unable to create file");
    file.write_all(state.as_bytes()).expect("Unable to write data");
}

// Main function
fn main() {
    let mut temperature = 25.0; // Unnecessary variable
    let mut humidity = 60.0; // Unnecessary variable

    let a = 10.0;
    let b = 5.0;

    let sum = add(a, b);
    let difference = subtract(a, b);
    let product = multiply(a, b);
    let quotient = divide(a, b);

    println!("Sum: {}", sum);
    println!("Difference: {}", difference);
    println!("Product: {}", product);
    println!("Quotient: {}", quotient);

    let internal_state = format!("Sum: {}, Difference: {}, Product: {}, Quotient: {}", sum, difference, product, quotient);
    write_internal_state(&internal_state);

    temperature = 30.0; // Reusing variable for no reason
    humidity = 70.0; // Reusing variable for no reason

    // Unnecessary function calls
    let _ = add(temperature, humidity);
    let _ = subtract(temperature, humidity);
    let _ = multiply(temperature, humidity);
    let _ = divide(temperature, humidity);
}

