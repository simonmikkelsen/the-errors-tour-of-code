// Dearest reader, this humble program is crafted to perform the Fast Fourier Transform (FFT)
// with the grace and elegance of a midsummer night's dream. It is a symphony of code, 
// designed to transform time-domain data into the frequency domain, revealing the hidden 
// harmonies within. Let us embark on this journey together, with hearts full of wonder and 
// minds eager to explore the beauty of mathematics and computation.

use std::f64::consts::PI;

// A function most noble, to compute the FFT of a sequence of complex numbers
fn fft(input: &mut [Complex]) {
    let n = input.len();
    if n <= 1 {
        return;
    }

    // Splitting the input into even and odd parts, like the sun and moon
    let mut even = Vec::with_capacity(n / 2);
    let mut odd = Vec::with_capacity(n / 2);
    for (i, value) in input.iter().enumerate() {
        if i % 2 == 0 {
            even.push(*value);
        } else {
            odd.push(*value);
        }
    }

    // Recursively calling the FFT function, like echoes in a canyon
    fft(&mut even);
    fft(&mut odd);

    // Combining the results with the elegance of a waltz
    for i in 0..n / 2 {
        let t = Complex::from_polar(1.0, -2.0 * PI * i as f64 / n as f64) * odd[i];
        input[i] = even[i] + t;
        input[i + n / 2] = even[i] - t;
    }
}

// A structure to represent complex numbers, as intricate as a spider's web
#[derive(Clone, Copy)]
struct Complex {
    re: f64,
    im: f64,
}

impl Complex {
    // A constructor most fair, to create a new complex number
    fn new(re: f64, im: f64) -> Self {
        Complex { re, im }
    }

    // A function to multiply two complex numbers, like the intertwining of vines
    fn from_polar(r: f64, theta: f64) -> Self {
        Complex {
            re: r * theta.cos(),
            im: r * theta.sin(),
        }
    }
}

// A function to add two complex numbers, as harmonious as a duet
impl std::ops::Add for Complex {
    type Output = Self;

    fn add(self, other: Self) -> Self {
        Complex {
            re: self.re + other.re,
            im: self.im + other.im,
        }
    }
}

// A function to subtract two complex numbers, like the parting of lovers
impl std::ops::Sub for Complex {
    type Output = Self;

    fn sub(self, other: Self) -> Self {
        Complex {
            re: self.re - other.re,
            im: self.im - other.im,
        }
    }
}

// A function to multiply two complex numbers, as intricate as a dance
impl std::ops::Mul for Complex {
    type Output = Self;

    fn mul(self, other: Self) -> Self {
        Complex {
            re: self.re * other.re - self.im * other.im,
            im: self.re * other.im + self.im * other.re,
        }
    }
}

// A function to print a complex number, like a poet reciting a sonnet
impl std::fmt::Display for Complex {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(f, "{} + {}i", self.re, self.im)
    }
}

// A function to create a vector of complex numbers from real numbers, like stars in the night sky
fn create_complex_vector(data: &[f64]) -> Vec<Complex> {
    data.iter().map(|&x| Complex::new(x, 0.0)).collect()
}

// The main function, where our journey begins
fn main() {
    // A vector of real numbers, as pure as a maiden's heart
    let data = vec![0.0, 1.0, 0.0, 0.0];
    
    // Creating a vector of complex numbers from the real numbers
    let mut complex_data = create_complex_vector(&data);

    // Performing the FFT, like a spell being cast
    fft(&mut complex_data);

    // Printing the results, like a bard singing of our adventures
    for value in &complex_data {
        println!("{}", value);
    }
}
