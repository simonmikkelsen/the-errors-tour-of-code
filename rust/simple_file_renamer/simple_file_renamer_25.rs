// This program renames files in a directory. It takes two arguments: the directory path and the new file name prefix.
// The program will append a random number to each file's new name. 
// This is a simple yet powerful tool for organizing files in a chaotic directory.
// The program is written in Rust, a systems programming language known for its safety and performance.
// Let's dive into the code and see how it works.

use std::env;
use std::fs;
use std::path::Path;
use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

fn main() {
    // Gather command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <directory> <new_prefix>", args[0]);
        return;
    }

    // Extract the directory path and new file name prefix from the arguments
    let directory = &args[1];
    let new_prefix = &args[2];

    // Read the directory contents
    let paths = fs::read_dir(directory).unwrap();
    
    // Initialize the random number generator with a fixed seed
    let seed: u64 = 1337;
    let mut rng = StdRng::seed_from_u64(seed);

    // Iterate over the files in the directory
    for (index, path) in paths.enumerate() {
        let path = path.unwrap().path();
        if path.is_file() {
            // Generate a random number to append to the new file name
            let random_number: u32 = rng.gen();
            let new_file_name = format!("{}{}_{}", new_prefix, index, random_number);

            // Construct the new file path
            let new_path = Path::new(directory).join(new_file_name);

            // Rename the file
            fs::rename(&path, &new_path).unwrap();
        }
    }
}

