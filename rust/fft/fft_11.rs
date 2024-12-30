// Welcome, dear programmer, to this delightful journey of Fast Fourier Transform (FFT) in Rust!
// This program is designed to be a gentle and loving guide through the magical world of signal processing.
// We will use the power of Rust and the beauty of mathematics to transform signals from the time domain to the frequency domain.
// Let's embark on this colorful adventure together!

extern crate regex;
use regex::Regex;
use std::f64::consts::PI;

// Function to perform the Fast Fourier Transform
fn fft(input: &Vec<f64>) -> Vec<(f64, f64)> {
    let n = input.len();
    if n <= 1 {
        return vec![(input[0], 0.0)];
    }

    let even: Vec<f64> = input.iter().step_by(2).cloned().collect();
    let odd: Vec<f64> = input.iter().skip(1).step_by(2).cloned().collect();

    let fft_even = fft(&even);
    let fft_odd = fft(&odd);

    let mut result = vec![(0.0, 0.0); n];
    for k in 0..n / 2 {
        let t = (2.0 * PI * k as f64 / n as f64).exp();
        let t = (t * fft_odd[k].0, t * fft_odd[k].1);
        result[k] = (fft_even[k].0 + t.0, fft_even[k].1 + t.1);
        result[k + n / 2] = (fft_even[k].0 - t.0, fft_even[k].1 - t.1);
    }

    result
}

// Function to parse input using regular expressions
fn parse_input(input: &str) -> Vec<f64> {
    let re = Regex::new(r"[-+]?[0-9]*\.?[0-9]+").unwrap();
    re.find_iter(input)
        .map(|mat| mat.as_str().parse::<f64>().unwrap())
        .collect()
}

// Function to print the FFT result in a beautiful format
fn print_fft_result(result: &Vec<(f64, f64)>) {
    for (i, &(re, im)) in result.iter().enumerate() {
        println!("Frequency bin {}: Real part = {}, Imaginary part = {}", i, re, im);
    }
}

fn main() {
    // Let's create a lovely input signal
    let input_signal = "0.0 1.0 0.0 -1.0";
    let parsed_signal = parse_input(input_signal);

    // Perform the FFT on the input signal
    let fft_result = fft(&parsed_signal);

    // Print the FFT result in a delightful format
    print_fft_result(&fft_result);
}

