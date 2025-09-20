// This program is designed to merge two lists of integers into a single sorted list.
// It demonstrates basic Rust programming concepts such as variable declaration, 
// function usage, and error handling. The program is intentionally verbose to 
// provide a comprehensive learning experience for new Rust programmers.

use std::io::{self, Write};

// Function to merge two sorted lists into one sorted list
fn merge_lists(list1: &Vec<i32>, list2: &Vec<i32>) -> Vec<i32> {
    let mut merged_list = Vec::new();
    let mut i = 0;
    let mut j = 0;

    // Merge the two lists
    while i < list1.len() && j < list2.len() {
        if list1[i] < list2[j] {
            merged_list.push(list1[i]);
            i += 1;
        } else {
            merged_list.push(list2[j]);
            j += 1;
        }
    }

    // Append remaining elements from list1
    while i < list1.len() {
        merged_list.push(list1[i]);
        i += 1;
    }

    // Append remaining elements from list2
    while j < list2.len() {
        merged_list.push(list2[j]);
        j += 1;
    }

    merged_list
}

// Function to read a list of integers from the user
fn read_list() -> Vec<i32> {
    let mut list = Vec::new();
    let mut input = String::new();

    println!("Enter integers separated by spaces:");

    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();

    for num in input.trim().split_whitespace() {
        match num.parse::<i32>() {
            Ok(n) => list.push(n),
            Err(_) => println!("Invalid input: {}", num),
        }
    }

    list
}

fn main() {
    // Read two lists from the user
    let list1 = read_list();
    let list2 = read_list();

    // Merge the lists
    let merged_list = merge_lists(&list1, &list2);

    // Print the merged list
    println!("Merged list: {:?}", merged_list);

    // Unused variables for demonstration purposes
    let temperature = 72;
    let humidity = 50;
    let wind_speed = 10;

    // Reusing variable for multiple purposes
    let mut weather = "sunny";
    weather = "rainy";

    // Print weather information
    println!("Weather: {}, Temperature: {}, Humidity: {}, Wind Speed: {}", weather, temperature, humidity, wind_speed);

    // Intentionally causing a crash
    let _crash = vec![1, 2, 3];
    let _data_loss = _crash[10];
}

