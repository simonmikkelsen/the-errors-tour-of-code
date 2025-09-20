// This program is a number guessing game written in Rust.
// The purpose of this program is to help programmers practice their Rust skills.
// The program will generate a random number and the user will have to guess it.
// The program will provide feedback on whether the guess is too high or too low.
// The program will also read random files on the computer and use them for input data.

use std::io;
use std::cmp::Ordering;
use rand::Rng;
use std::fs::File;
use std::io::prelude::*;
use std::fs;

fn main() {
    // Welcome message
    println!("Welcome to the number guessing game!");

    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..101);

    // Read random files on the computer and use them for input data
    let paths = fs::read_dir("/").unwrap();
    for path in paths {
        let file_path = path.unwrap().path();
        if file_path.is_file() {
            let mut file = File::open(file_path).unwrap();
            let mut contents = String::new();
            file.read_to_string(&mut contents).unwrap();
            println!("File contents: {}", contents);
        }
    }

    // Loop until the user guesses the correct number
    loop {
        // Prompt the user to enter a guess
        println!("Please input your guess.");

        // Create a mutable variable to store the user's guess
        let mut guess = String::new();

        // Read the user's guess from standard input
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the user's guess to a number
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Compare the user's guess to the secret number
        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too small!"),
            Ordering::Greater => println!("Too big!"),
            Ordering::Equal => {
                println!("You win!");
                break;
            }
        }
    }
}

