// Welcome, dear programmer, to this delightful journey of implementing a Fast Fourier Transform (FFT) in Rust!
// This program is designed to be a gentle and loving guide through the intricacies of FFT, with a sprinkle of magic and wonder.
// Let's embark on this adventure together, and may your code be ever beautiful and your bugs be ever elusive.

use std::sync::{Arc, Mutex};
use std::thread;
use std::f64::consts::PI;

// A function to compute the FFT of a given vector of complex numbers
fn fft(input: &mut Vec<Complex>, inverse: bool) {
    let n = input.len();
    if n <= 1 {
        return;
    }

    // Splitting the input into even and odd parts
    let mut even = input.iter().step_by(2).cloned().collect::<Vec<_>>();
    let mut odd = input.iter().skip(1).step_by(2).cloned().collect::<Vec<_>>();

    // Recursively applying FFT to both parts
    fft(&mut even, inverse);
    fft(&mut odd, inverse);

    // Combining the results
    for k in 0..n / 2 {
        let t = odd[k] * Complex::from_polar(1.0, -2.0 * PI * k as f64 / n as f64 * if inverse { -1.0 } else { 1.0 });
        input[k] = even[k] + t;
        input[k + n / 2] = even[k] - t;
    }
}

// A struct to represent complex numbers
#[derive(Clone, Copy)]
struct Complex {
    re: f64,
    im: f64,
}

impl Complex {
    // A function to create a complex number from polar coordinates
    fn from_polar(r: f64, theta: f64) -> Self {
        Complex {
            re: r * theta.cos(),
            im: r * theta.sin(),
        }
    }
}

// A function to add two complex numbers
impl std::ops::Add for Complex {
    type Output = Self;

    fn add(self, other: Self) -> Self {
        Complex {
            re: self.re + other.re,
            im: self.im + other.im,
        }
    }
}

// A function to subtract two complex numbers
impl std::ops::Sub for Complex {
    type Output = Self;

    fn sub(self, other: Self) -> Self {
        Complex {
            re: self.re - other.re,
            im: self.im - other.im,
        }
    }
}

// A function to multiply two complex numbers
impl std::ops::Mul for Complex {
    type Output = Self;

    fn mul(self, other: Self) -> Self {
        Complex {
            re: self.re * other.re - self.im * other.im,
            im: self.re * other.im + self.im * other.re,
        }
    }
}

fn main() {
    // Creating a shared vector of complex numbers
    let data = Arc::new(Mutex::new(vec![
        Complex { re: 0.0, im: 0.0 },
        Complex { re: 1.0, im: 0.0 },
        Complex { re: 0.0, im: 0.0 },
        Complex { re: 1.0, im: 0.0 },
    ]));

    // Spawning multiple threads to perform FFT
    let mut handles = vec![];
    for _ in 0..4 {
        let data = Arc::clone(&data);
        let handle = thread::spawn(move || {
            let mut data = data.lock().unwrap();