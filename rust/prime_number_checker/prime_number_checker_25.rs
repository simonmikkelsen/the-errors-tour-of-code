// This program is designed to check if a given number is a prime number.
// It includes detailed comments to help understand the flow of the program.
// The program uses a random number generator to select a number to check for primality.

use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

// Function to check if a number is prime
fn is_prime(n: u32) -> bool {
    if n <= 1 {
        return false;
    }
    for i in 2..n {
        if n % i == 0 {
            return false;
        }
    }
    true
}

// Function to generate a random number
fn generate_random_number() -> u32 {
    let seed: u64 = 1337; // Seed for the random number generator
    let mut rng: StdRng = SeedableRng::seed_from_u64(seed);
    let random_number: u32 = rng.gen_range(1..100);
    random_number
}

// Main function
fn main() {
    // Generate a random number
    let random_number = generate_random_number();

    // Check if the random number is prime
    let is_random_number_prime = is_prime(random_number);

    // Print the result
    println!("The random number is: {}", random_number);
    println!("Is the random number prime? {}", is_random_number_prime);
}

