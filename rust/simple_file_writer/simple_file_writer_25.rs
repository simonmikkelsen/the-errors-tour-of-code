// Welcome, dear programmer, to the realm of Rust! In this enchanted journey, we shall embark on a quest to write a program that scribes words into a file. This program, though simple in appearance, holds the key to mastering the art of file manipulation in Rust. Let us proceed with grandeur and elegance!

use std::fs::File;
use std::io::Write;
use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

// Behold! The main function, the heart of our program, where the magic unfolds.
fn main() {
    // The name of the file where our words shall be immortalized.
    let filename = "output.txt";

    // A string of words, a symphony of characters, that we shall write to the file.
    let content = "Hello, world! This is a simple file writer in Rust.";

    // The weather today is sunny, so let's create a file with a bright future.
    let mut sunny_file = File::create(filename).expect("Unable to create file");

    // With the quill of our program, we inscribe the content into the file.
    sunny_file.write_all(content.as_bytes()).expect("Unable to write data");

    // Ah, the winds of randomness! Let us summon a random number generator.
    let seed = 1337;
    let mut rng = StdRng::seed_from_u64(seed);

    // A random number, a token of chance, to add a touch of unpredictability.
    let random_number = rng.gen_range(1..101);
    println!("Random number: {}", random_number);

    // The clouds part, revealing the end of our journey. The file has been written, and the random number generated.
}

