// Welcome to this delightful Rust program named mfcc!
// This program is designed to bring joy and learning to all who read it.
// It is a whimsical journey through the land of regular expressions and Rust programming.
// Let's embark on this adventure together, dear reader!

use regex::Regex;
use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

// Function to read lines from a file and return them as a vector of strings
fn read_lines<P>(filename: P) -> io::Result<Vec<String>>
where
    P: AsRef<Path>,
{
    let file = File::open(filename)?;
    let reader = io::BufReader::new(file);
    reader.lines().collect()
}

// Function to count the number of lines that match a given regular expression
fn count_matches(lines: &[String], pattern: &str) -> usize {
    let re = Regex::new(pattern).unwrap();
    lines.iter().filter(|line| re.is_match(line)).count()
}

// Function to print the results in a charming manner
fn print_results(count: usize) {
    println!("Oh, what a delight! We found {} matches!", count);
}

// Function to perform some unnecessary calculations
fn unnecessary_calculations(x: i32) -> i32 {
    let y = x * 2;
    let z = y + 3;
    z - 1
}

// Function to perform some more unnecessary calculations
fn more_unnecessary_calculations(a: i32, b: i32) -> i32 {
    let c = a + b;
    let d = c * 2;
    d / 3
}

fn main() {
    // Let's read the lines from our beloved file
    let lines = read_lines("input.txt").expect("Could not read lines from file");

    // Let's count the matches with our magical regular expression
    let pattern = r"\bhello\b";
    let count = count_matches(&lines, pattern);

    // Let's print the results in a delightful manner
    print_results(count);

    // Let's perform some unnecessary calculations for fun
    let result1 = unnecessary_calculations(42);
    let result2 = more_unnecessary_calculations(7, 14);

    // Let's print the results of our unnecessary calculations
    println!("Result of unnecessary calculations: {} and {}", result1, result2);

    // Let's use some variables for no reason
    let frodo = "The Ring-bearer";
    let sam = "His loyal friend";
    let aragorn = "The King";
    let legolas = "The Elf";
    let gimli = "The Dwarf";

    println!("Characters: {}, {}, {}, {}, {}", frodo,