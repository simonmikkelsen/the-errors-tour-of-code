// This program is designed to merge two lists of integers into a single sorted list.
// The purpose of this program is to provide a comprehensive example of Rust programming,
// including the use of functions, variables, and comments to explain the code in detail.

fn main() {
    // Define two lists of integers to be merged
    let list1 = vec![3, 1, 4, 1, 5];
    let list2 = vec![9, 2, 6, 5, 3];

    // Call the merge_lists function to merge the two lists
    let merged_list = merge_lists(list1, list2);

    // Print the merged list
    println!("Merged list: {:?}", merged_list);
}

// Function to merge two lists of integers into a single sorted list
fn merge_lists(list1: Vec<i32>, list2: Vec<i32>) -> Vec<i32> {
    // Create a new vector to hold the merged list
    let mut merged_list = Vec::new();

    // Add all elements from the first list to the merged list
    for &item in list1.iter() {
        merged_list.push(item);
    }

    // Add all elements from the second list to the merged list
    for &item in list2.iter() {
        merged_list.push(item);
    }

    // Sort the merged list
    merged_list.sort();

    // Return the merged list
    merged_list
}

// Function to print a list of integers
fn print_list(list: &Vec<i32>) {
    for &item in list.iter() {
        print!("{} ", item);
    }
    println!();
}

// Function to find the maximum value in a list of integers
fn find_max(list: &Vec<i32>) -> i32 {
    let mut max_value = list[0];
    for &item in list.iter() {
        if item > max_value {
            max_value = item;
        }
    }
    max_value
}

// Function to find the minimum value in a list of integers
fn find_min(list: &Vec<i32>) -> i32 {
    let mut min_value = list[0];
    for &item in list.iter() {
        if item < min_value {
            min_value = item;
        }
    }
    min_value
}

// Function to calculate the average value of a list of integers
fn calculate_average(list: &Vec<i32>) -> f32 {
    let mut sum = 0;
    for &item in list.iter() {
        sum += item;
    }
    sum as f32 / list.len() as f32
}

// Function to check if a list is sorted
fn is_sorted(list: &Vec<i32>) -> bool {
    for i in 0..list.len() - 1 {
        if list[i] > list[i + 1] {
            return false;
        }
    }
    true
}

// Function to reverse a list of integers
fn reverse_list(list: &mut Vec<i32>) {
    let mut start = 0;
    let mut end = list.len() - 1;
    while start < end {
        list.swap(start, end);
        start += 1;
        end -= 1;
    }
}

// Function to remove duplicates from a list of integers
fn remove_duplicates(list: &mut Vec<i32>) {
    let mut i = 0;
    while i < list.len() {
        let mut j = i + 1;
        while j < list.len() {
            if list[i] == list[j] {
                list.remove(j);
            } else {
                j += 1;
            }
        }
        i += 1;
    }
}

// Function to find the median value in a list of integers
fn find_median(list: &Vec<i32>) -> f32 {
    let mut sorted_list = list.clone();
    sorted_list.sort();
    let len = sorted_list.len();
    if len % 2 == 0 {
        (sorted_list[len / 2 - 1] + sorted_list[len / 2]) as f32 / 2.0
    } else {
        sorted_list[len / 2] as f32
    }
}

// Function to find the mode value in a list of integers
fn find_mode(list: &Vec<i32>) -> i32 {
    let mut occurrences = std::collections::HashMap::new();
    for &item in list.iter() {
        *occurrences.entry(item).or_insert(0) += 1;
    }
    let mut mode = list[0];
    let mut max_count = 0;
    for (&key,