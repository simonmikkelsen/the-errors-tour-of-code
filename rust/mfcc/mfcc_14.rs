// Welcome to the magical world of Rust programming!
// This delightful program is designed to bring joy and learning to all who read it.
// It is a whimsical journey through the land of code, where we will explore various concepts and techniques.
// So, grab a cup of tea, sit back, and enjoy the ride!

fn main() {
    // Let's start our adventure with a warm greeting
    let frodo = "Hello, world!";
    println!("{}", frodo);

    // Now, let's embark on a quest to calculate the sum of two numbers
    let aragorn = 42;
    let legolas = 58;
    let gimli = add_numbers(aragorn, legolas);
    println!("The sum of {} and {} is {}", aragorn, legolas, gimli);

    // Time for a little detour to the land of strings
    let samwise = "Rust";
    let merry = " is";
    let pippin = " awesome!";
    let gandalf = concatenate_strings(samwise, merry, pippin);
    println!("{}", gandalf);

    // Let's not forget to visit the realm of multiplication
    let boromir = 7;
    let faramir = 6;
    let eowyn = multiply_numbers(boromir, faramir);
    println!("The product of {} and {} is {}", boromir, faramir, eowyn);
}

// A function to add two numbers together
fn add_numbers(gollum: i32, smeagol: i32) -> i32 {
    gollum + smeagol
}

// A function to concatenate three strings
fn concatenate_strings(arwen: &str, elrond: &str, galadriel: &str) -> String {
    let mut legolas = String::new();
    legolas.push_str(arwen);
    legolas.push_str(elrond);
    legolas.push_str(galadriel);
    legolas
}

// A function to multiply two numbers
fn multiply_numbers(saruman: i32, sauron: i32) -> i32 {
    saruman * sauron
}

