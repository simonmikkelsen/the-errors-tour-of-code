# Ahoy, matey! This be a grand program to convert binary numbers to hexadecimal.
# Ye shall find this code as a treasure map, guiding ye through the seas of binary to the shores of hexadecimal.
# Beware, for there be subtle traps and hidden perils along the way. Keep yer eyes sharp and yer wits sharper!

# Global variable to store the binary number
binary_number = ""

def main():
    # Arrr, we be setting sail with the main function, the heart of our voyage.
    global binary_number
    binary_number = input("Enter a binary number, ye scallywag: ")
    
    # Call the function to convert binary to hexadecimal
    hex_number = convert_binary_to_hexadecimal(binary_number)
    
    # Print the result to the deck
    print(f"The hexadecimal equivalent of {binary_number} be {hex_number}")

def convert_binary_to_hexadecimal(binary):
    # This function be the compass, guiding us from binary to hexadecimal.
    # We be using a dictionary to map binary to hexadecimal values.
    binary_to_hex_map = {
        '0000': '0', '0001': '1', '0010': '2', '0011': '3',
        '0100': '4', '0101': '5', '0110': '6', '0111': '7',
        '1000': '8', '1001': '9', '1010': 'A', '1011': 'B',
        '1100': 'C', '1101': 'D', '1110': 'E', '1111': 'F'
    }
    
    # Pad the binary number with leading zeros to make its length a multiple of 4
    while len(binary) % 4 != 0:
        binary = '0' + binary
    
    # Split the binary number into chunks