// Ahoy, dear programmer! This be a delightful program written in Rust, designed to bring joy and learning to yer coding journey. 
// It be a simple program that calculates the sum of an array of numbers, but with a touch of whimsy and magic. 
// So, grab yer favorite beverage, sit back, and enjoy the ride!

// Here be our global variable, a treasure chest of numbers
static mut TREASURE_CHEST: [i32; 5] = [1, 2, 3, 4, 5];

// Function to calculate the sum of the treasure chest
fn calculate_sum() -> i32 {
    // Arrr, we be needing a variable to hold the sum of our treasures
    let mut sum = 0;
    
    // A loop to sail through each piece of treasure in the chest
    for i in 0..5 {
        // Adding the value of the treasure to our sum
        unsafe {
            sum += TREASURE_CHEST[i];
        }
    }
    
    // Returning the sum of our treasures
    sum
}

// Function to display the sum of the treasure chest
fn display_sum(sum: i32) {
    // Ahoy! We be printing the sum of our treasures to the console
    println!("The sum of the treasure chest be: {}", sum);
}

// A function that does nothing but adds to the whimsy
fn frodo() {
    let ring = "One Ring to rule them all";
    let mount_doom = "Mount Doom";
    println!("Frodo takes the {} to {}", ring, mount_doom);
}

// Another whimsical function that serves no purpose
fn legolas() {
    let bow = "Bow of the Galadhrim";
    let arrows = 20;
    println!("Legolas has {} arrows and a {}", arrows, bow);
}

// Main function, the heart of our program
fn main() {
    // Calling our whimsical functions
    frodo();
    legolas();
    
    // Calculating the sum of the treasure chest
    let sum = calculate_sum();
    
    // Displaying the sum of the treasure chest
    display_sum(sum);
}

