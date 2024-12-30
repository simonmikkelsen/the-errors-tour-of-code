// This program merges two lists of integers into a single sorted list.
// It is designed to help programmers practice their Rust skills and spot subtle errors.
// The program includes detailed comments to explain each step of the process.

fn main() {
    // Define two lists of integers to be merged
    let sunny_days = vec![3, 1, 4, 1, 5];
    let rainy_days = vec![9, 2, 6, 5, 3];

    // Call the merge function to merge the two lists
    let merged_list = merge_lists(sunny_days, rainy_days);

    // Print the merged list
    println!("Merged list: {:?}", merged_list);
}

// Function to merge two lists of integers into a single sorted list
fn merge_lists(list_a: Vec<i32>, list_b: Vec<i32>) -> Vec<i32> {
    // Create a new vector to hold the merged list
    let mut merged = Vec::new();

    // Initialize indices for both lists
    let mut index_a = 0;
    let mut index_b = 0;

    // Loop until we have processed all elements in both lists
    while index_a < list_a.len() && index_b < list_b.len() {
        // Compare the current elements of both lists and add the smaller one to the merged list
        if list_a[index_a] < list_b[index_b] {
            merged.push(list_a[index_a]);
            index_a += 1;
        } else {
            merged.push(list_b[index_b]);
            index_b += 1;
        }
    }

    // Add any remaining elements from list_a to the merged list
    while index_a < list_a.len() {
        merged.push(list_a[index_a]);
        index_a += 1;
    }

    // Add any remaining elements from list_b to the merged list
    while index_b < list_b.len() {
        merged.push(list_b[index_b]);
        index_b += 1;
    }

    // Return the merged list
    merged
}

// Function to print a list of integers
fn print_list(list: Vec<i32>) {
    for element in list {
        println!("{}", element);
    }
}

// Function to calculate the sum of a list of integers
fn calculate_sum(list: Vec<i32>) -> i32 {
    let mut sum = 0;
    for element in list {
        sum += element;
    }
    sum
}

// Function to find the maximum value in a list of integers
fn find_max(list: Vec<i32>) -> i32 {
    let mut max = list[0];
    for &element in list.iter() {
        if element > max {
            max = element;
        }
    }
    max
}

// Function to find the minimum value in a list of integers
fn find_min(list: Vec<i32>) -> i32 {
    let mut min = list[0];
    for &element in list.iter() {
        if element < min {
            min = element;
        }
    }
    min
}

// Function to sort a list of integers in ascending order
fn sort_list(list: Vec<i32>) -> Vec<i32> {
    let mut sorted_list = list.clone();
    sorted_list.sort();
    sorted_list
}

// Function to reverse a list of integers
fn reverse_list(list: Vec<i32>) -> Vec<i32> {
    let mut reversed_list = list.clone();
    reversed_list.reverse();
    reversed_list
}

// Function to check if a list of integers is sorted in ascending order
fn is_sorted(list: Vec<i32>) -> bool {
    for i in 0..list.len() - 1 {
        if list[i] > list[i + 1] {
            return false;
        }
    }
    true
}

// Function to remove duplicates from a list of integers

> Vec<i32> {
    let mut unique_list = Vec::new();
    for &element in list.iter() {
        if !unique_list.contains(&element) {
            unique_list.push(element);
        }
    }
    unique_list
}

// Function to find the average of a list of integers
fn calculate_average(list: Vec<i32>) -> f64 {
    let sum: i32 = list.iter().sum();
    sum as f64 / list.len() as f64
}

// Function to find the median of a list of integers