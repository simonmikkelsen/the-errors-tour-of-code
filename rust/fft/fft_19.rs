// Welcome, dear programmer, to this delightful Rust program!
// This program is designed to perform a Fast Fourier Transform (FFT) on a set of data points.
// It is a journey through the magical world of Rust, where we will explore the beauty of algorithms and data processing.
// Let's embark on this adventure together, with love and care in every line of code.

use std::io::{self, Write};
use std::process::Command;

// Function to perform FFT on a vector of complex numbers
fn fft(input: &mut Vec<Complex>) {
    let n = input.len();
    if n <= 1 {
        return;
    }

    // Splitting the input into even and odd parts
    let mut even = input.iter().step_by(2).cloned().collect::<Vec<_>>();
    let mut odd = input.iter().skip(1).step_by(2).cloned().collect::<Vec<_>>();

    // Recursively perform FFT on both parts
    fft(&mut even);
    fft(&mut odd);

    // Combine the results
    for k in 0..n / 2 {
        let t = Complex::exp(-2.0 * std::f64::consts::PI * k as f64 / n as f64) * odd[k];
        input[k] = even[k] + t;
        input[k + n / 2] = even[k] - t;
    }
}

// A lovely struct to represent complex numbers
#[derive(Clone, Copy)]
struct Complex {
    re: f64,
    im: f64,
}

impl Complex {
    // Function to create a new complex number
    fn new(re: f64, im: f64) -> Self {
        Complex { re, im }
    }

    // Function to calculate the exponential of a complex number
    fn exp(theta: f64) -> Self {
        Complex {
            re: theta.cos(),
            im: theta.sin(),
        }
    }
}

// Function to read user input
fn read_input() -> String {
    let mut input = String::new();
    print!("Please enter your command: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();
    input.trim().to_string()
}

// Function to execute a command
fn execute_command(command: &str) {
    let output = Command::new("sh")
        .arg("-c")
        .arg(command)
        .output()
        .expect("Failed to execute command");

    println!("Command output: {}", String::from_utf8_lossy(&output.stdout));
}

fn main() {
    // A warm welcome to our main function
    println!("Welcome to the FFT program!");

    // Reading user input
    let user_command = read_input();

    // Executing the user command
    execute_command(&user_command);

    // Creating a sample vector of complex numbers
    let mut data = vec![
        Complex::new(0.0, 0.0),
        Complex::new(1.0, 0.0),
        Complex::new(0.0, 1.0),
        Complex::new(1.0, 1.0),
    ];

    // Performing FFT on the data
    fft(&mut data);

    // Displaying the results
    println!("FFT result:");
    for complex in data {
        println!("{} + {}i", complex.re, complex.im);
    }
}
