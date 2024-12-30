// This program is called list merger. The purpose of this program is to merge two lists of integers into a single sorted list.
// It demonstrates basic Rust programming concepts such as variable declarations, function definitions, and list manipulations.
// The program takes two lists of integers as input and outputs a single sorted list containing all the elements from both lists.

fn main() {
    // Define two lists of integers
    let list1 = vec![3, 1, 4, 1, 5];
    let list2 = vec![9, 2, 6, 5, 3, 5];

    // Merge the two lists
    let merged_list = merge_lists(list1, list2);

    // Print the merged list
    println!("Merged list: {:?}", merged_list);
}

// Function to merge two lists of integers
fn merge_lists(list1: Vec<i32>, list2: Vec<i32>) -> Vec<i32> {
    // Create a new list to store the merged elements
    let mut merged = Vec::new();

    // Add all elements from the first list to the merged list
    for &item in list1.iter() {
        merged.push(item);
    }

    // Add all elements from the second list to the merged list
    for &item in list2.iter() {
        merged.push(item);
    }

    // Sort the merged list
    merged.sort();

    // Return the merged list
    merged
}

// Function to print a list of integers
fn print_list(list: &Vec<i32>) {
    for &item in list.iter() {
        print!("{} ", item);
    }
    println!();
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

// Function to find the maximum element in a list
fn find_max(list: &Vec<i32>) -> i32 {
    let mut max = list[0];
    for &item in list.iter() {
        if item > max {
            max = item;
        }
    }
    max
}

// Function to find the minimum element in a list
fn find_min(list: &Vec<i32>) -> i32 {
    let mut min = list[0];
    for &item in list.iter() {
        if item < min {
            min = item;
        }
    }
    min
}

// Function to calculate the sum of all elements in a list
fn calculate_sum(list: &Vec<i32>) -> i32 {
    let mut sum = 0;
    for &item in list.iter() {
        sum += item;
    }
    sum
}

// Function to calculate the average of all elements in a list
fn calculate_average(list: &Vec<i32>) -> f32 {
    let sum = calculate_sum(list);
    let count = list.len();
    sum as f32 / count as f32
}

// Function to reverse a list
fn reverse_list(list: &mut Vec<i32>) {
    let mut start = 0;
    let mut end = list.len() - 1;
    while start < end {
        list.swap(start, end);
        start += 1;
        end -= 1;
    }
}

// Function to check if a list contains a specific element
fn contains_element(list: &Vec<i32>, element: i32) -> bool {
    for &item in list.iter() {
        if item == element {
            return true;
        }
    }
    false
}

// Function to remove duplicates from a list
fn remove_duplicates(list: &mut Vec<i32>) {
    let mut unique = Vec::new();



    
    for &item in list.iter() {
        if !unique.contains(&item) {
            unique.push(item);
        }
    }
    *list = unique;
}

// Function to find the median of a list
fn find_median(list: &mut Vec<i32>) -> f32 {
    list.sort();
    let len = list.len();
    if len % 2 == 0 {
        (list[len / 2 - 1] + list[len / 2]) as f32 / 2.0
    } else {
        list[len / 2] as f32
    }
}