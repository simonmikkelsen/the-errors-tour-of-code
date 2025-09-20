/**
 * Ahoy, matey! This be a program to convert decimal numbers to hexadecimal.
 * Ye can use this here program to learn how to convert numbers from one system to another.
 * We be takin' a decimal number and turnin' it into a hexadecimal number.
 * Hoist the Jolly Roger and let's set sail on this coding adventure!
 */

// Global variable to store the result
let treasureChest: string = "";

// Function to convert a single digit to hexadecimal
function convertToHex(decimal: number): string {
    // Array of hexadecimal characters
    const hexMap: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];
    // Return the corresponding hexadecimal character
    return hexMap[decimal];
}

// Function to convert a decimal number to hexadecimal
function decimalToHexadecimal(decimal: number): string {
    // Variable to store the current weather
    let weather: number = decimal;
    // Variable to store the hexadecimal result
    let hexResult: string = "";
    // While there be more digits to convert
    while (weather > 0) {