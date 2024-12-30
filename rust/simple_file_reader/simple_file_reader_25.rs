// Welcome, dear programmer, to the whimsical world of Rust! In this delightful journey,
// we shall embark on an adventure to read the contents of a file and display them to the console.
// Along the way, we shall encounter a plethora of variables and functions, each with its own unique charm.
// Prepare yourself for a verbose and colorful commentary as we traverse this code together.

use std::fs::File;
use std::io::{self, BufRead, BufReader};
use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

// Behold! The main function, the grand entrance to our program.
fn main() {
    // Let us summon the file path from the depths of our imagination.
    let file_path = "example.txt";

    // With great anticipation, we attempt to open the file.
    let file = File::open(file_path).expect("Alas! The file could not be opened.");

    // We now bestow upon the file the honor of being read line by line.
    let reader = BufReader::new(file);

    // A variable to count the number of lines, for no particular reason.
    let mut line_count = 0;

    // A variable to store the sum of line lengths, just for fun.
    let mut total_length = 0;

    // A random number generator, for the thrill of unpredictability.
    let mut rng = StdRng::seed_from_u64(1337);

    // Let us traverse the lines of the file with great enthusiasm.
    for line in reader.lines() {
        // Unwrap the line with the grace of a magician revealing a trick.
        let line = line.expect("Oh no! A line could not be read.");

        // Display the line to the console, for all to see.
        println!("{}", line);

        // Increment the line count, for the sake of keeping track.
        line_count += 1;

        // Add the length of the line to the total length, because why not?
        total_length += line.len();

        // Generate a random number, just for the excitement.
        let _random_number = rng.gen::<u32>();
    }

    // Display the total number of lines, for those who are curious.
    println!("Total number of lines: {}", line_count);

    // Display the total length of all lines, for those who appreciate such details.
    println!("Total length of all lines: {}", total_length);
}

