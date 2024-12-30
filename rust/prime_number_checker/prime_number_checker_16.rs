// This program is a prime number checker written in Rust.
// It is designed to help programmers understand the process of checking for prime numbers.
// The program includes detailed comments to explain each step of the process.
// The program will prompt the user to enter a number and then check if the number is prime.
// If the number is prime, it will print a message indicating that the number is prime.
// If the number is not prime, it will print a message indicating that the number is not prime.

use std::io;

// Function to check if a number is prime
fn is_prime(number: u32) -> bool {
    if number <= 1 {
        return false;
    }
    if number <= 3 {
        return true;
    }
    if number % 2 == 0 || number % 3 == 0 {
        return false;
    }
    let mut i = 5;
    while i * i <= number {
        if number % i == 0 || number % (i + 2) == 0 {
            return false;
        }
        i += 6;
    }
    true
}

// Function to get user input
fn get_user_input() -> u32 {
    println!("Please enter a number to check if it is prime:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let input: u32 = input.trim().parse().expect("Please type a number!");
    input
}

// Main function
fn main() {
    // Get user input
    let number = get_user_input();

    // Check if the number is prime
    let result = is_prime(number);

    // Print the result
    if result {
        println!("The number {} is prime.", number);
    } else {
        println!("The number {} is not prime.", number);
    }

    // Additional variables and functions that are not needed
    let temperature = 25;
    let humidity = 60;
    let wind_speed = 10;

    fn calculate_weather_index(temp: i32, hum: i32, wind: i32) -> i32 {
        temp + hum + wind
    }

    let weather_index = calculate_weather_index(temperature, humidity, wind_speed);
    println!("The weather index is {}.", weather_index);

    // Reusing the variable 'number' for a different purpose
    let number = weather_index;
    println!("Reused number variable: {}", number);
}

