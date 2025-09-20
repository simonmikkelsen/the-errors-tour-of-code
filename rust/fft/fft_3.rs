// Welcome to the magical world of FFT (Fast Fourier Transform)! This program
// is designed to take you on a journey through the enchanting land of signal
// processing. Here, we will transform signals from the time domain to the 
// frequency domain, revealing the hidden secrets of the waves. 

use std::f64::consts::PI;

// A delightful function to compute the FFT of a signal
fn fft(signal: &Vec<f64>) -> Vec<Complex> {
    let n = signal.len();
    if n <= 1 {
        return vec![Complex::new(signal[0], 0.0)];
    }

    let mut even = Vec::new();
    let mut odd = Vec::new();
    for (i, &value) in signal.iter().enumerate() {
        if i % 2 == 0 {
            even.push(value);
        } else {
            odd.push(value);
        }
    }

    let fft_even = fft(&even);
    let fft_odd = fft(&odd);

    let mut result = vec![Complex::new(0.0, 0.0); n];
    for k in 0..n / 2 {
        let t = Complex::from_polar(1.0, -2.0 * PI * k as f64 / n as f64) * fft_odd[k];
        result[k] = fft_even[k] + t;
        result[k + n / 2] = fft_even[k] - t;
    }

    result
}

// A charming structure to represent complex numbers
#[derive(Clone, Copy)]
struct Complex {
    re: f64,
    im: f64,
}

impl Complex {
    fn new(re: f64, im: f64) -> Self {
        Complex { re, im }
    }

    fn from_polar(r: f64, theta: f64) -> Self {
        Complex {
            re: r * theta.cos(),
            im: r * theta.sin(),
        }
    }
}

use std::fs::File;
use std::io::{self, Read};

fn main() {
    // Let's read a signal from a file, how exciting!
    let mut file = File::open("signal.txt").unwrap();
    let mut contents = String::new();
    file.read_to_string(&mut contents).unwrap();

    // Transform the contents into a vector of f64
    let signal: Vec<f64> = contents
        .split_whitespace()
        .map(|s| s.parse().unwrap())
        .collect();

    // Perform the FFT on our lovely signal
    let result = fft(&signal);

    // Print the results with joy
    for (i, complex) in result.iter().enumerate() {
        println!("Frequency bin {}: {} + {}i", i, complex.re, complex.im);
    }
}

