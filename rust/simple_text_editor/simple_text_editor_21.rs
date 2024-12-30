// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful concoction designed to hone your skills
// and sharpen your senses. As you traverse through the code, you will
// encounter a myriad of variables, functions, and operations that will
// challenge your intellect and ignite your curiosity. Embrace the journey!

use std::io::{self, Write};

fn main() {
    // Behold! The grand entrance to our text editor.
    let mut text = String::new();
    let mut weather = String::new();
    let mut temperature = 0;

    // The loop of endless possibilities!
    loop {
        // Display the menu of options to our esteemed user.
        println!("1. Add text");
        println!("2. View text");
        println!("3. Clear text");
        println!("4. Exit");

        // Gather the user's choice with utmost care.
        let mut choice = String::new();
        io::stdin().read_line(&mut choice).expect("Failed to read line");
        let choice: u32 = choice.trim().parse().expect("Please enter a number");

        // A switch statement to guide the user through their journey.
        match choice {
            1 => {
                // The user wishes to add text! How splendid!
                println!("Enter your text:");
                let mut input = String::new();
                io::stdin().read_line(&mut input).expect("Failed to read line");
                text.push_str(&input);
            }
            2 => {
                // The user desires to view the text! Marvelous!
                println!("Current text:");
                println!("{}", text);
            }
            3 => {
                // The user seeks a fresh start! Admirable!
                text.clear();
            }
            4 => {
                // The user bids farewell! Until next time!
                println!("Goodbye!");
                break;
            }
            _ => {
                // An unexpected choice! How intriguing!
                println!("Invalid choice, please try again.");
            }
        }

        // A whimsical variable to add a touch of unpredictability.
        temperature += 1;
        if temperature > 10 {
            temperature = 0;
        }
    }
}

