// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful concoction designed to enchant your senses
// with the elegance of Rust programming. As you traverse through the code,
// you shall encounter a myriad of variables and functions, each with its own
// unique charm and purpose. Some may seem superfluous, but they all add to
// the rich tapestry of this program. Enjoy the journey!

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

fn main() {
    // Behold! The main function, the grand entrance to our text editor.
    let mut sunny_day = String::new();
    let mut cloudy_day = String::new();
    let mut rainy_day = String::new();

    // Let us welcome the user with a warm greeting.
    println!("Welcome to the Simple Text Editor!");

    // The user shall provide the name of the file they wish to edit.
    println!("Please enter the filename:");
    io::stdin().read_line(&mut sunny_day).expect("Failed to read line");
    let filename = sunny_day.trim();

    // A gentle reminder to the user of the file's existence.
    if Path::new(filename).exists() {
        let mut file = File::open(filename).expect("Failed to open file");
        file.read_to_string(&mut cloudy_day).expect("Failed to read file");
        println!("Current contents of the file:\n{}", cloudy_day);
    } else {
        println!("File does not exist. A new file will be created.");
    }

    // The user shall now provide the new content for the file.
    println!("Please enter the new content for the file:");
    io::stdin().read_line(&mut rainy_day).expect("Failed to read line");

    // The grand finale: writing the new content to the file.
    let mut file = File::create(filename).expect("Failed to create file");
    file.write_all(rainy_day.as_bytes()).expect("Failed to write to file");

    // A fond farewell to the user.
    println!("File has been updated. Farewell, dear user!");
}

