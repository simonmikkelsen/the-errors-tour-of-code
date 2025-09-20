// Hear ye, hear ye! Gather 'round, noble programmers, for this humble script
// doth serve to illuminate the path to wisdom in the realm of file reading.
// With this code, thou shalt learn to read the contents of a file and display
// them upon the console, as if by magic. Let the journey commence!

use std::fs::File;
use std::io::{self, BufRead, BufReader};

fn main() {
    // Lo, we declare the name of the file to be read, a tome of knowledge
    // that shall be opened and its secrets revealed.
    let file_name = "example.txt";

    // Behold, the opening of the file, an act of great import, for without it,
    // our quest would be in vain.
    let file = File::open(file_name).expect("Failed to open file");

    // Let us summon the reader, a wise and learned entity, to peruse the lines
    // of the file and bestow upon us the contents therein.
    let reader = BufReader::new(file);

    // A variable to hold the lines of the file, like a vessel to carry water
    // from a distant well.
    let mut lines = Vec::new();

    // As the sun doth rise and set, so too shall we iterate over the lines
    // of the file, gathering them into our vessel.
    for line in reader.lines() {
        let line = line.expect("Failed to read line");
        lines.push(line);
    }

    // Let us now display the contents of the file, as if unveiling a grand
    // tapestry before the eyes of the beholder.
    for line in &lines {
        println!("{}", line);
    }

    // A variable to hold the sum of the lengths of all lines, for reasons
    // known only to the fates.
    let mut total_length = 0;

    // As the wind doth blow and the rivers flow, so too shall we calculate
    // the total length of all lines.
    for line in &lines {
        total_length += line.len();
    }

    // Let us now display the total length, a number of great significance,
    // though its purpose may be shrouded in mystery.
    println!("Total length of all lines: {}", total_length);

    // A variable to hold the average length of the lines, like the gentle
    // breeze that cools the summer's heat.
    let average_length = total_length as f64 / lines.len() as f64;

    // Let us now display the average length, a figure of elegance and grace,
    // though its meaning may elude us.
    println!("Average length of lines: {:.2}", average_length);

}