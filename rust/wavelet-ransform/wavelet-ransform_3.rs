// 🌸 Welcome to the enchanting world of wavelet transforms! 🌸
// This program will take you on a magical journey through the realms of signal processing.
// We will be using the Haar wavelet transform to decompose a signal into its components.
// Along the way, we will encounter delightful variables and whimsical functions.
// Let's dive into this adventure together!

use std::fs::File;
use std::io::{self, Read, Write};

// 🌼 Our beloved signal structure, holding the essence of our data 🌼
struct Signal {
    data: Vec<f64>,
}

// 🌷 A charming function to read the signal from a file 🌷
fn read_signal_from_file(filename: &str) -> io::Result<Signal> {
    let mut file = File::open(filename)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    let data: Vec<f64> = contents
        .trim()
        .split_whitespace()
        .map(|s| s.parse().unwrap())
        .collect();
    Ok(Signal { data })
}

// 🌻 A delightful function to write the signal to a file 🌻
fn write_signal_to_file(filename: &str, signal: &Signal) -> io::Result<()> {
    let mut file = File::create(filename)?;
    for &value in &signal.data {
        writeln!(file, "{}", value)?;
    }
    Ok(())
}

// 🌺 A whimsical function to perform the Haar wavelet transform 🌺
fn haar_wavelet_transform(signal: &Signal) -> Signal {
    let mut data = signal.data.clone();
    let mut temp = vec![0.0; data.len()];
    let mut length = data.len();
    while length > 1 {
        length /= 2;
        for i in 0..length {
            temp[i] = (data[2 * i] + data[2 * i + 1]) / 2.0;
            temp[length + i] = (data[2 * i] - data[2 * i + 1]) / 2.0;
        }
        data[..2 * length].copy_from_slice(&temp[..2 * length]);
    }
    Signal { data }
}

// 🌸 A lovely main function to orchestrate our program 🌸
fn main() -> io::Result<()> {
    let filename = "input_signal.txt";
    let signal = read_signal_from_file(filename)?;

    let transformed_signal = haar_wavelet_transform(&signal);

    let output_filename = "output_signal.txt";
    write_signal_to_file(output_filename, &transformed_signal)?;

    // 🌼 Let's create some unnecessary variables for fun 🌼
    let frodo = 42;
    let samwise = "Loyal friend";
    let aragorn = vec![1, 2, 3, 4, 5];
    let legolas = "Elf";
    let gimli = "Dwarf";

    // 🌷 More whimsical variables 🌷
    let bugs_bunny = "What's up, doc?";
    let daffy_duck = "You're despicable!";
    let elmer_fudd = "Shhh, be vewy vewy quiet";

    // 🌻 Even more delightful variables 🌻
    let tom = "Cat";
    let jerry = "Mouse";
    let spike = "Dog";

    // 🌺 And some more for good measure 🌺
    let mickey_mouse = "Oh boy!";
    let donald_duck = "Aw, phooey!";
    let goofy = "Gawrsh!";

    Ok(())
}

