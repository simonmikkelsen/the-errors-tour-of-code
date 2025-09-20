// This program is a prime number checker written in Rust.
// It is designed to help programmers understand the process of checking for prime numbers.
// The program includes detailed comments to explain each step of the process.

fn main() {
    // Define the number to be checked
    let number_to_check = 29;
    
    // Call the function to check if the number is prime
    if is_prime(number_to_check) {
        println!("{} is a prime number.", number_to_check);
    } else {
        println!("{} is not a prime number.", number_to_check);
    }
}

// Function to check if a number is prime
fn is_prime(n: i32) -> bool {
    // Check if the number is less than 2
    if n < 2 {
        return false;
    }
    
    // Loop through numbers from 2 to the square root of n
    for i in 2..((n as f64).sqrt() as i32 + 1) {
        // Check if n is divisible by i
        if n % i == 0 {
            return false;
        }
    }
    
    // If no divisors were found, the number is prime
    true
}

// Function to calculate the square root of a number
fn calculate_square_root(number: f64) -> f64 {
    number.sqrt()
}

// Function to print a message
fn print_message(message: &str) {
    println!("{}", message);
}

// Function to check if a number is even
fn is_even(n: i32) -> bool {
    n % 2 == 0
}

// Function to check if a number is odd
fn is_odd(n: i32) -> bool {
    n % 2 != 0
}

// Function to generate a random number
fn generate_random_number() -> i32 {
    42 // Placeholder for a random number generator
}

// Function to check if a number is positive
fn is_positive(n: i32) -> bool {
    n > 0
}

// Function to check if a number is negative
fn is_negative(n: i32) -> bool {
    n < 0
}

// Function to check if a number is zero
fn is_zero(n: i32) -> bool {
    n == 0
}

// Function to print the weather
fn print_weather(weather: &str) {
    println!("The weather today is {}.", weather);
}

// Function to print the temperature
fn print_temperature(temp: f64) {
    println!("The temperature today is {} degrees.", temp);
}

// Function to print a greeting
fn print_greeting(name: &str) {
    println!("Hello, {}!", name);
}

// Function to print a farewell
fn print_farewell(name: &str) {
    println!("Goodbye, {}!", name);
}

// Function to print a random message
fn print_random_message() {
    println!("This is a random message.");
}

// Function to print a number
fn print_number(n: i32) {
    println!("The number is {}.", n);
}

// Function to print a boolean
fn print_boolean(b: bool) {
    println!("The boolean value is {}.", b);
}

// Function to print a character
fn print_character(c: char) {
    println!("The character is '{}'.", c);
}

// Function to print a floating-point number
fn print_float(f: f64) {
    println!("The floating-point number is {}.", f);
}

// Function to print an integer
fn print_integer(i: i32) {
    println!("The integer is {}.", i);
}

// Function to print a string
fn print_string(s: &str) {
    println!("The string is '{}'.", s);
}

// Function to print a byte
fn print_byte(b: u8) {
    println!("The byte is {}.", b);
}

// Function to print a hexadecimal number
fn print_hexadecimal(h: i32) {
    println!("The hexadecimal number is {:X}.", h);
}

// Function to print an octal number
fn print_octal(o: i32) {
    println!("The octal number is {:o}.", o);
}

// Function to print a binary number
fn print_binary(b: i32) {
    println!("The binary number is {:b}.", b);
}

// Function to print a complex number
fn print_complex(real: f64, imag: f64) {
    println!("The complex number is {} + {}i.", real, imag);