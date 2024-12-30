// This program is designed to merge two lists of integers into a single sorted list.
// It demonstrates basic Rust programming concepts such as variable declarations, 
// function definitions, and loops. The program takes two lists as input, merges them, 
// and then sorts the merged list. The final sorted list is printed to the console.

fn main() {
    // Define two lists of integers
    let list1 = vec![3, 1, 4, 1, 5];
    let list2 = vec![9, 2, 6, 5, 3, 5];

    // Merge the two lists
    let merged_list = merge_lists(list1, list2);

    // Sort the merged list
    let sorted_list = sort_list(merged_list);

    // Print the sorted list
    println!("Sorted list: {:?}", sorted_list);
}

// Function to merge two lists of integers
fn merge_lists(list1: Vec<i32>, list2: Vec<i32>) -> Vec<i32> {
    let mut merged = Vec::new();
    for &item in list1.iter() {
        merged.push(item);
    }
    for &item in list2.iter() {
        merged.push(item);
    }
    merged
}

// Function to sort a list of integers
fn sort_list(mut list: Vec<i32>) -> Vec<i32> {
    let mut sorted = Vec::new();
    while !list.is_empty() {
        let mut min_index = 0;
        for i in 1..list.len() {
            if list[i] < list[min_index] {
                min_index = i;
            }
        }
        sorted.push(list.remove(min_index));
    }
    sorted
}

