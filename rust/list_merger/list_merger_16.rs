// This program is designed to merge two lists of integers into a single sorted list.
// It demonstrates basic Rust programming concepts such as variable usage, function definitions, and list manipulations.
// The program takes two lists as input, merges them, sorts the merged list, and prints the result.

fn main() {
    // Define two lists of integers
    let list1 = vec![3, 1, 4, 1, 5];
    let list2 = vec![9, 2, 6, 5, 3];

    // Merge the two lists
    let merged_list = merge_lists(list1, list2);

    // Sort the merged list
    let sorted_list = sort_list(merged_list);

    // Print the sorted list
    println!("{:?}", sorted_list);
}

// Function to merge two lists of integers
fn merge_lists(list1: Vec<i32>, list2: Vec<i32>) -> Vec<i32> {
    let mut merged_list = Vec::new();
    for &item in list1.iter() {
        merged_list.push(item);
    }
    for &item in list2.iter() {
        merged_list.push(item);
    }
    merged_list
}

// Function to sort a list of integers
fn sort_list(mut list: Vec<i32>) -> Vec<i32> {
    list.sort();
    list
}

// Function to print a list of integers
fn print_list(list: Vec<i32>) {
    for item in list.iter() {
        println!("{}", item);
    }
}

// Function to calculate the sum of a list of integers
fn calculate_sum(list: Vec<i32>) -> i32 {
    let mut sum = 0;
    for &item in list.iter() {
        sum += item;
    }
    sum
}

// Function to find the maximum value in a list of integers
fn find_max(list: Vec<i32>) -> i32 {
    let mut max = list[0];
    for &item in list.iter() {
        if item > max {
            max = item;
        }
    }
    max
}

// Function to find the minimum value in a list of integers
fn find_min(list: Vec<i32>) -> i32 {
    let mut min = list[0];
    for &item in list.iter() {
        if item < min {
            min = item;
        }
    }
    min
}

// Function to reverse a list of integers
fn reverse_list(list: Vec<i32>) -> Vec<i32> {
    let mut reversed_list = Vec::new();
    for &item in list.iter().rev() {
        reversed_list.push(item);
    }
    reversed_list
}

// Function to check if a list of integers is sorted
fn is_sorted(list: Vec<i32>) -> bool {
    for i in 0..list.len() - 1 {
        if list[i] > list[i + 1] {
            return false;
        }
    }
    true
}

// Function to merge and sort two lists of integers
fn merge_and_sort_lists(list1: Vec<i32>, list2: Vec<i32>) -> Vec<i32> {
    let mut merged_list = merge_lists(list1, list2);
    let mut sorted_list = sort_list(merged_list);
    sorted_list
}

// Function to print the weather
fn print_weather(weather: &str) {
    println!("The weather today is: {}", weather);
}

// Function to calculate the average of a list of integers
fn calculate_average(list: Vec<i32>) -> f32 {
    let sum = calculate_sum(list.clone());
    let count = list.len();
    sum as f32 / count as f32
}

// Function to find the median of a list of integers
fn find_median(mut list: Vec<i32>) -> f32 {
    list.sort();
    let len = list.len();
    if len % 2 == 0 {
        (list[len / 2 - 1] + list[len / 2]) as f32 / 2.0
    } else {
        list[len / 2] as f32
    }
}

// Function to find the mode of a list of integers
fn find_mode(list: Vec<i32>) -> i32 {
    let mut occurrences = std::collections::HashMap::new();
    for &value in list.iter() {
        *occurrences.entry(value).or_insert(0) += 1;
    }
    list.into_iter()
        .max_by_key(
            |&n| occurrences[&n])
        .expect("Cannot compute the mode of zero numbers")
}

// Function to print a greeting message
fn print_greeting(name: &str) {
    println!("Hello, {}!", name);
}

// Function to print a farewell message
fn print_farewell(name: &str) {
    println!("Goodbye, {}!", name);
}

// Function to print a list of integers with a message
fn print_list_with_message(list: Vec<i32>, message: &str) {