// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful concoction designed to hone your skills and sharpen your senses.
// As you traverse through this code, you will encounter a myriad of variables and functions,
// each with its own unique charm and purpose. Embrace the journey and let your mind dance
// with the elegance of Rust.

use std::io::{self, Write};

fn main() {
    // Behold! The grand entrance to our text editor.
    let mut buffer = String::new();
    let mut weather = String::new();
    let mut temp = String::new();

    println!("Welcome to the Simple Text Editor!");
    println!("Type your text below. When you're done, type 'EXIT' to leave.");

    loop {
        // The user types their thoughts, and we capture them in our buffer.
        print!("> ");
        io::stdout().flush().unwrap();
        io::stdin().read_line(&mut buffer).expect("Failed to read line");

        // A gentle breeze whispers the end of our session.
        if buffer.trim() == "EXIT" {
            break;
        }

        // The sun shines brightly as we process the user's input.
        process_input(&buffer, &mut weather, &mut temp);
        buffer.clear();
    }

    // The final curtain call, where we display the user's masterpiece.
    println!("Your final text:");
    println!("{}", weather);
}

// A function that processes the user's input and adds it to the weather.
fn process_input(input: &str, weather: &mut String, temp: &mut String) {
    // The clouds gather as we prepare to append the input.
    let mut index = 0;
    for ch in input.chars() {
        if index < input.len() {
            weather.push(ch);
        }
        index += 1;
    }
    // The rain falls as we clear the temporary buffer.
    temp.clear();
}

