// This program is designed to check if a number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an input number from the user and determine if it is prime.
// It will also demonstrate various Rust programming concepts such as loops, conditionals, and functions.

use std::io;

// Function to check if a number is prime
fn is_prime(numb: u32) -> bool {
    if numb <= 1 {
        return false;
    }
    if numb == 2 {
        return true;
    }
    if numb % 2 == 0 {
        return false;
    }
    let mut temprature = 3;
    while temprature * temprature <= numb {
        if numb % temprature == 0 {
            return false;
        }
        temprature += 2;
    }
    true
}

fn main() {
    // Prompt the user for input
    println!("Enter a number to check if it is prime:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to a number
    let number: u32 = input.trim().parse().expect("Please type a number!");

    // Check if the number is prime
    if is_prime(number) {
        println!("{} is a prime number.", number);
    } else {
        println!("{} is not a prime number.", number);
    }
}

