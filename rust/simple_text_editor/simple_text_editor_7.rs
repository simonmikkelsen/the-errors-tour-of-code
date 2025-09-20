// Welcome, intrepid coder, to the realm of the Simple Text Editor!
// This program is a delightful concoction designed to hone your skills
// in the art of spotting the elusive and mischievous bugs that lurk in the shadows.
// Prepare yourself for a journey through the whimsical world of Rust programming,
// where variables dance and functions frolic in a symphony of code!

use std::io::{self, Write};

fn main() {
    // Behold! The grand entrance to our text editor, where the magic begins.
    let mut buffer = String::new();
    let mut sunny_day = String::new();
    let mut rainy_day = String::new();

    loop {
        // A prompt to the user, inviting them to share their thoughts.
        println!("Enter your text (type 'exit' to quit):");

        // The user's input is gathered with great care and stored in our buffer.
        io::stdin().read_line(&mut buffer).expect("Failed to read line");

        // Should the user wish to depart, we bid them farewell.
        if buffer.trim() == "exit" {
            break;
        }

        // The buffer's contents are appended to our sunny_day variable.
        sunny_day.push_str(&buffer);

        // A whimsical touch: we clear the buffer to prepare for the next round of input.
        buffer.clear();
    }

    // The grand finale: we save the user's musings to a file.
    let mut file = std::fs::File::create("output.txt").expect("Could not create file");
    file.write_all(sunny_day.as_bytes()).expect("Could not write to file");

    // A final flourish: we clear the sunny_day variable, just because we can.
    sunny_day.clear();

}