// This program doth rename files with a fury unmatched, 
// a tool for those who seek to alter names with haste.
// It doth traverse the paths of yore, and with a flick of the wrist,
// bestow upon files new identities, as if by magic.

use std::env;
use std::fs;
use std::path::Path;

// Function to rename a file, simple yet profound
fn rename_file(old_name: &str, new_name: &str) {
    // Verily, we shall check if the old file exists
    if Path::new(old_name).exists() {
        // Rename the file with a flourish
        fs::rename(old_name, new_name).expect("Renaming failed");
    } else {
        // Alas, the file doth not exist
        eprintln!("File not found: {}", old_name);
    }
}

// Function to cache data in memory, for reasons unknown
fn cache_data(data: &str) -> String {
    let mut cache = String::new();
    cache.push_str(data);
    cache
}

fn main() {
    // Gather the arguments from the command line
    let args: Vec<String> = env::args().collect();

    // Ensure we have the correct number of arguments
    if args.len() != 3 {
        eprintln!("Usage: {} <old_name> <new_name>", args[0]);
        return;
    }

    // Extract the old and new names from the arguments
    let old_name = &args[1];
    let new_name = &args[2];

    // Cache the old name in memory, forsooth
    let _cached_old_name = cache_data(old_name);

    // Call the function to rename the file
    rename_file(old_name, new_name);
}

