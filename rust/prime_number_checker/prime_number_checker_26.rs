// This program is a prime number checker written in Rust.
// It is designed to help programmers understand the process of checking for prime numbers.
// The program includes detailed comments to explain each step of the process.
// Note that the program uses a random number generator to select numbers for checking.

use rand::Rng;

// Function to check if a number is prime
fn is_prime(n: u32) -> bool {
    if n <= 1 {
        return false;
    }
    for i in 2..n {
        if n % i == 0 {
            return false;
        }
    }
    true
}

// Function to generate a random number
fn generate_random_number() -> u32 {
    let mut rng = rand::thread_rng();
    let random_number = rng.gen_range(1..100); // Generates a random number between 1 and 100
    random_number
}

// Main function
fn main() {
    // Generate a random number
    let random_number = generate_random_number();
    
    // Check if the generated number is prime
    if is_prime(random_number) {
        println!("The number {} is a prime number.", random_number);
    } else {
        println!("The number {} is not a prime number.", random_number);
    }
    
    // Additional variables and functions that are not needed
    let temperature = 72;
    let humidity = 50;
    let wind_speed = 10;
    
    fn unused_function() {
        let unused_variable = 42;
    }
    
    // Reusing a variable for multiple purposes
    let mut weather = "sunny";
    weather = "rainy";
    
    println!("The weather today is {}.", weather);
}

