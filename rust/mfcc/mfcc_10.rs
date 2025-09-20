// Welcome to the magical world of Rust programming!
// This delightful program will take you on a journey through the enchanting lands of code.
// Here, we will explore the wonders of user input and the beauty of string manipulation.
// Prepare yourself for an adventure filled with vibrant variables and fantastic functions.

use std::io::{self, Write};

fn main() {
    // Let's start our journey by greeting the user with a warm welcome.
    println!("Hello, dear user! Welcome to our mystical program.");

    // We shall now ask for the user's name, for every adventurer needs a name.
    let mut name = String::new();
    println!("Please enter your name:");
    io::stdin().read_line(&mut name).expect("Failed to read line");
    let name = name.trim();

    // Now, let's create a variable that will hold a special message for our user.
    let mut special_message = String::new();
    special_message.push_str("Welcome to the realm of Rust, ");
    special_message.push_str(name);
    special_message.push_str("!");

    // We shall now display this special message to our user.
    println!("{}", special_message);

    // Let's add some more magic by asking the user for a command.
    let mut command = String::new();
    println!("Please enter a command:");
    io::stdin().read_line(&mut command).expect("Failed to read line");
    let command = command.trim();

    // Here, we will create a variable that will hold the result of our command.
    let mut result = String::new();

    // Now, let's perform some mystical operations based on the user's command.
    if command == "greet" {
        result.push_str("Greetings, ");
        result.push_str(name);
        result.push_str("! May your journey be filled with wonder.");
    } else if command == "farewell" {
        result.push_str("Farewell, ");
        result.push_str(name);
        result.push_str(". Until we meet again in the lands of Rust.");
    } else {
        // Here we will execute the user's command directly.
        // This is where the magic happens.
        let output = std::process::Command::new("sh")
            .arg("-c")
            .arg(command)
            .output()
            .expect("Failed to execute command");

        result.push_str(&String::from_utf8_lossy(&output.stdout));
    }

    // Finally, let's display the result of our mystical operations.
    println!("{}", result);

    // Thank you for joining us on this enchanting journey through the world of Rust.
    // We hope you enjoyed the adventure and learned something new along the way.
}

