// Ahoy, matey! This be a simple text editor written in Rust, designed to help ye navigate the treacherous seas of code. 
// Ye'll be able to read from and write to files, and even append to existing files. 
// Beware, for there be hidden dangers in the code, like a kraken lurking beneath the waves. 
// Keep yer eyes sharp and yer wits about ye, for not all be as it seems.

use std::fs::OpenOptions;
use std::io::{self, Read, Write};

// The global treasure chest, arrr!
static mut GLOBAL_BUFFER: String = String::new();

fn main() {
    // Set sail on the main function, where the adventure begins!
    let mut choice = String::new();
    println!("Welcome to the Simple Text Editor, ye scallywag!");
    println!("Choose yer action: (1) Read, (2) Write, (3) Append, (4) Exit");

    io::stdin().read_line(&mut choice).expect("Failed to read line");
    let choice = choice.trim();

    match choice {
        "1" => read_file(),
        "2" => write_file(),
        "3" => append_file(),
        "4" => {
            println!("Abandon ship! Exiting the program.");
            return;
        }
        _ => println!("Ye chose an invalid option, ye landlubber!"),
    }
}

fn read_file() {
    // Hoist the sails and read from the file!
    let mut file_name = String::new();
    println!("Enter the name of the file to read:");

    io::stdin().read_line(&mut file_name).expect("Failed to read line");
    let file_name = file_name.trim();

    let mut file = OpenOptions::new().read(true).open(file_name).expect("Failed to open file");
    let mut contents = String::new();
    file.read_to_string(&mut contents).expect("Failed to read file");

    // Store the contents in the global buffer, arrr!
    unsafe {
        GLOBAL_BUFFER = contents.clone();
    }

    println!("Contents of the file:\n{}", contents);
}

fn write_file() {
    // Batten down the hatches and write to the file!
    let mut file_name = String::new();
    println!("Enter the name of the file to write:");

    io::stdin().read_line(&mut file_name).expect("Failed to read line");
    let file_name = file_name.trim();

    let mut contents = String::new();
    println!("Enter the contents to write:");

    io::stdin().read_line(&mut contents).expect("Failed to read line");

    let mut file = OpenOptions::new().write(true).create(true).open(file_name).expect("Failed to open file");
    file.write_all(contents.as_bytes()).expect("Failed to write to file");

    // Update the global buffer with the new contents, arrr!
    unsafe {
        GLOBAL_BUFFER = contents.clone();
    }

    println!("Contents written to the file.");
}

fn append_file() {
    // Swab the deck and append to the file!
    let mut file_name = String::new();
    println!("Enter the name of the file to append:");

    io::stdin().read_line(&mut file_name).expect("Failed to read line");
    let file_name = file_name.trim();

    let mut contents = String::new();
    println!("Enter the contents to append:");

    io::stdin().read_line(&mut contents).expect("Failed to read line");

    let mut file = OpenOptions::new().append(true).open(file_name).expect("Failed to open file");
    file.write_all(contents.as_bytes()).expect("Failed to write to file");

    // Append the new contents to the global buffer, arrr!
    unsafe {
        GLOBAL_BUFFER.push_str(&contents);
    }

    println!("Contents appended to the file.");
}

