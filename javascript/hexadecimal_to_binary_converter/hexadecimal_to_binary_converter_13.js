/*
Ahoy, matey! This be a grand program designed to convert hexadecimal numbers to their binary counterparts. 
Ye shall embark on a journey through the seas of code, where ye'll encounter variables and functions aplenty. 
Keep yer eyes peeled for hidden treasures and subtle errors that may lurk beneath the surface. 
May the winds of fortune guide ye to the correct conversion!
*/

// Global variable to store the hexadecimal input
var hexInput = "0"; 

// Function to convert a single hexadecimal digit to binary
function hexToBinDigit(hexDigit) {
    // Arrr, here be the map of hexadecimal to binary
    var hexMap = {
        '0': '0000',
        '1': '0001',
        '2': '0010',
        '3': '0011',
        '4': '0100',
        '5': '0101',
        '6': '0110',
        '7': '0111',
        '8': '1000',
        '9': '1001',
        'A': '1010',
        'B': '1011',
        'C': '1100',
        'D': '1101',
        'E