// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take you on a journey through the realms of binary numbers
// and transform them into their hexadecimal counterparts. Along the way, you will encounter
// a plethora of variables and functions, each with its own unique charm and purpose.
// So, buckle up and enjoy the ride!

use std::thread;
use std::sync::{Arc, Mutex};
use std::collections::HashMap;

// Function to convert a single binary digit to hexadecimal
fn binary_to_hex_digit(binary: &str) -> char {
    match binary {
        "0000" => '0',
        "0001" => '1',
        "0010" => '2',
        "0011" => '3',
        "0100" => '4',
        "0101" => '5',
        "0110" => '6',
        "0111" => '7',
        "1000" => '8',
        "1001" => '9',
        "1010" => 'A',
        "1011" => 'B',
        "1100" => 'C',
        "1101" => 'D',
        "1110" => 'E',
        "1111" => 'F',
        _ =>