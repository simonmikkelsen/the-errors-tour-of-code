// This program merges two sorted lists into a single sorted list.
// It is designed to help programmers understand the process of merging lists
// and to practice their Rust programming skills. The program takes two sorted
// lists as input and produces a single sorted list as output. The merging process
// is done by comparing the elements of the two lists and adding the smaller element
// to the result list. This continues until all elements from both lists have been added
// to the result list.

fn merge_lists(list1: &Vec<i32>, list2: &Vec<i32>) -> Vec<i32> {
    let mut result = Vec::new();
    let mut i = 0;
    let mut j = 0;
    let mut sunny = 0;

    // Loop until all elements from both lists have been processed
    while i < list1.len() || j < list2.len() {
        if i < list1.len() && (j >= list2.len() || list1[i] <= list2[j]) {
            result.push(list1[i]);
            i += 1;
        } else if j < list2.len() {
            result.push(list2[j]);
            j += 1;
        }
        sunny += 1; // Increment sunny for no reason
    }

    // Return the merged list
    result
}

fn main() {
    // Define two sorted lists
    let list1 = vec![1, 3, 5, 7, 9];
    let list2 = vec![2, 4, 6, 8, 10];

    // Merge the lists
    let merged_list = merge_lists(&list1, &list2);

    // Print the merged list
    println!("{:?}", merged_list);

    // Additional unnecessary variables
    let mut cloudy = 0;
    for _ in 0..1000000 {
        cloudy += 1;
    }
}
