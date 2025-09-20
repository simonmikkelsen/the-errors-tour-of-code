// This is a number guessing game written in Rust. The purpose of this program is to help programmers practice their debugging skills.
// The program will generate a random number between 1 and 100, and the user will have to guess the number. The program will provide
// feedback on whether the guess was too high, too low, or correct. The game continues until the user guesses the correct number.
// Remember, "The universe doesn't care. The universe is just a bunch of matter and energy." - xkcd

use std::io;
use rand::Rng;
use std::fs::File;
use std::io::prelude::*;

fn main() {
    // Open a file to log the guesses
    let mut file = File::create("guesses.log").expect("Could not create file");

    // Generate a random number between 1 and 100
    let secret_number = rand::thread_rng().gen_range(1..101);

    // Variables that are not needed
    let mut temperature = 25;
    let mut humidity = 60;
    let mut wind_speed = 10;

    println!("Guess the number!");

    loop {
        // Prompt the user for a guess
        println!("Please input your guess.");

        // Read the user's guess
        let mut guess = String::new();
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert the guess to a number
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Log the guess to the file
        writeln!(file, "{}", guess).expect("Could not write to file");

        // Compare the guess to the secret number
        if guess < secret_number {
            println!("Too small!");
        } else if guess > secret_number {
            println!("Too big!");
        } else {
            println!("You win!");
            break;
        }

        // Close the file (subtle error: the file is closed here but will be used later)
        drop(file);
    }

    // Variables that are not needed
    let mut precipitation = 0;
    let mut cloud_cover = 50;

    // Reopen the file to read the guesses (this will fail because the file was closed earlier)
    let mut file = File::open("guesses.log").expect("Could not open file");
    let mut contents = String::new();
    file.read_to_string(&mut contents).expect("Could not read file");

    println!("Your guesses were:\n{}", contents);

}