// Welcome to this delightful Rust program that performs a Fast Fourier Transform (FFT).
// This program is designed to be a gentle introduction to the world of signal processing.
// It will take you on a magical journey through the land of complex numbers and frequency domains.
// So, grab a cup of tea, sit back, and enjoy the ride!

use std::f64::consts::PI;

// Function to compute the FFT of a given vector of complex numbers
fn fft(input: &Vec<Complex>) -> Vec<Complex> {
    let n = input.len();
    if n <= 1 {
        return input.clone();
    }

    // Splitting the input into even and odd parts
    let mut even = Vec::new();
    let mut odd = Vec::new();
    for (i, value) in input.iter().enumerate() {
        if i % 2 == 0 {
            even.push(*value);
        } else {
            odd.push(*value);
        }
    }

    // Recursive calls to compute FFT of even and odd parts
    let fft_even = fft(&even);
    let fft_odd = fft(&odd);

    // Combining the results
    let mut result = vec![Complex::new(0.0, 0.0); n];
    for k in 0..n / 2 {
        let t = Complex::from_polar(1.0, -2.0 * PI * k as f64 / n as f64) * fft_odd[k];
        result[k] = fft_even[k] + t;
        result[k + n / 2] = fft_even[k] - t;
    }

    result
}

// A struct to represent complex numbers
#[derive(Clone, Copy)]
struct Complex {
    re: f64,
    im: f64,
}

impl Complex {
    // Function to create a new complex number
    fn new(re: f64, im: f64) -> Complex {
        Complex { re, im }
    }

    // Function to multiply two complex numbers
    fn mul(self, other: Complex) -> Complex {
        Complex {
            re: self.re * other.re - self.im * other.im,
            im: self.re * other.im + self.im * other.re,
        }
    }

    // Function to add two complex numbers
    fn add(self, other: Complex) -> Complex {
        Complex {
            re: self.re + other.re,
            im: self.im + other.im,
        }
    }

    // Function to subtract two complex numbers
    fn sub(self, other: Complex) -> Complex {
        Complex {
            re: self.re - other.re,
            im: self.im - other.im,
        }
    }

    // Function to create a complex number from polar coordinates
    fn from_polar(r: f64, theta: f64) -> Complex {
        Complex {
            re: r * theta.cos(),
            im: r * theta.sin(),
        }
    }
}

fn main() {
    // Let's create a vector of complex numbers to test our FFT function
    let input = vec![
        Complex::new(0.0, 0.0),
        Complex::new(1.0, 0.0),
        Complex::new(0.0, 0.0),
        Complex::new(0.0, 0.0),
    ];

    // Calling the FFT function and storing the result
    let result = fft(&input);

    // Printing the result
    for (i, value) in result.iter().enumerate() {
        println!("Result[{}] = {} + {}i", i, value.re, value.im);
    }
}

