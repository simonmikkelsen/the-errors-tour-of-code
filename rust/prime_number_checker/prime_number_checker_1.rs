// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an input number from the user and determine if it is prime.
// It will use various functions and variables to achieve this goal.

use std::io;

// Function to get user input
fn get_user_input() -> u32 {
    let mut input = String::new();
    println!("Please enter a number to check if it is prime:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let number: u32 = input.trim().parse().expect("Please type a number!");
    number
}

// Function to check if a number is prime
fn is_prime(number: u32) -> bool {
    if number <= 1 {
        return false;
    }
    if number == 2 {
        return true;
    }
    if number % 2 == 0 {
        return false;
    }
    let mut is_prime = true;
    let mut i = 3;
    while i * i <= number {
        if number % i == 0 {
            is_prime = false;
            break;
        }
        i += 2;
    }
    is_prime
}

// Function to print the result
fn print_result(number: u32, is_prime: bool) {
    if is_prime {
        println!("The number {} is a prime number.", number);
    } else {
        println!("The number {} is not a prime number.", number);
    }
}

// Main function
fn main() {
    let number = get_user_input();
    let prime_status = is_prime(number);
    print_result(number, prime_status);
}

