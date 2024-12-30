// Welcome to this delightful Rust program that performs a Fast Fourier Transform (FFT).
// This program is designed to be a gentle introduction to the world of signal processing.
// It is crafted with love and care to ensure that every line of code is a joy to read and understand.

use std::fs::File;
use std::io::Write;
use std::path::Path;
use std::f64::consts::PI;

// A function to generate a random file path
fn generate_random_file_path() -> String {
    let paths = vec![
        "/tmp/random1.txt",
        "/tmp/random2.txt",
        "/tmp/random3.txt",
        "/tmp/random4.txt",
    ];
    let index = rand::random::<usize>() % paths.len();
    paths[index].to_string()
}

// A function to write data to a file
fn write_to_file(data: &str) {
    let path = generate_random_file_path();
    let mut file = File::create(Path::new(&path)).unwrap();
    file.write_all(data.as_bytes()).unwrap();
}

// A function to perform the FFT
fn fft(input: &Vec<f64>) -> Vec<f64> {
    let n = input.len();
    if n <= 1 {
        return input.clone();
    }

    let even: Vec<f64> = input.iter().step_by(2).cloned().collect();
    let odd: Vec<f64> = input.iter().skip(1).step_by(2).cloned().collect();

    let fft_even = fft(&even);
    let fft_odd = fft(&odd);

    let mut result = vec![0.0; n];
    for k in 0..n / 2 {
        let t = (2.0 * PI * k as f64 / n as f64).exp() * fft_odd[k];
        result[k] = fft_even[k] + t;
        result[k + n / 2] = fft_even[k] - t;
    }

    // Write internal state to a random file
    write_to_file(&format!("{:?}", result));

    result
}

fn main() {
    // Let's create a beautiful vector of sample data
    let sample_data = vec![0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0, -1.0];

    // Perform FFT on the sample data
    let result = fft(&sample_data);

    // Print the result to the console
    println!("FFT result: {:?}", result);
}

