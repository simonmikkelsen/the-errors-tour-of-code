# Ahoy, matey! This be a grand program to write to a file, arrr!
# The purpose of this here code be to show ye how to open a file,
# write some text to it, and then close it up like a treasure chest.
# Ye'll be learnin' the ways of file handling in Ruby, savvy?

# Hoist the colors! Here be the global variable to hold the file name.
$treasure_map = "output.txt"

# Set sail on the open seas of code!
def open_the_chest
    # Arrr, we be openin' the file for writin', ye scallywags!
    $chest = File.open($treasure_map, "w")
end

# Write the secret message to the file, arrr!
def write_the_secret
    # X marks the spot! Here be the secret message.
    secret_message = "Here be the hidden treasure!"
    # Write the message to the file, ye landlubbers!
    $chest.puts(secret_message)
end

# Batten down the hatches and close the file, arrr!
def close_the_chest
    # We be closin' the file now, matey!
    $chest.close
end

# Call the functions to perform the tasks, arrr!
open_the_chest
write_the_secret
close_the_chest

