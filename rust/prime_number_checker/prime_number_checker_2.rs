// This program is a prime number checker written in Rust.
// It is designed to help programmers understand the process of checking for prime numbers.
// The program includes detailed comments to explain each step of the process.

fn main() {
    // Define a number to check if it is prime
    let number_to_check = 29;
    
    // Call the function to check if the number is prime
    let is_prime = check_prime(number_to_check);
    
    // Print the result
    if is_prime {
        println!("{} is a prime number.", number_to_check);
    } else {
        println!("{} is not a prime number.", number_to_check);
    }
}

// Function to check if a number is prime
fn check_prime(number: u32) -> bool {
    // If the number is less than 2, it is not prime
    if number < 2 {
        return false;
    }
    
    // Loop through numbers from 2 to the square root of the number
    for i in 2..=((number as f64).sqrt() as u32) {
        // If the number is divisible by any of these numbers, it is not prime
        if number % i == 0 {
            return false;
        }
    }
    
    // If the number is not divisible by any of these numbers, it is prime
    true
}

// Function to allocate memory for an array of numbers
fn allocate_memory(size: usize) -> Vec<u32> {
    let mut vec = Vec::with_capacity(size);
    for i in 0..size {
        vec.push(i as u32);
    }
    vec
}

// Function to check the weather (not needed in this program)
fn check_weather() {
    let weather = "sunny";
    println!("The weather today is {}.", weather);
}

// Function to print a message (not needed in this program)
fn print_message(message: &str) {
    println!("{}", message);
}

// Function to create a memory leak
fn create_memory_leak() {
    let _leak = Box::new(allocate_memory(1000000));
    // The memory allocated here is never freed
}

// Call the function to create a memory leak
create_memory_leak();

