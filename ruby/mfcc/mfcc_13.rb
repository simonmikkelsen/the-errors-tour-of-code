# Ahoy, dear programmer! This be a delightful Ruby program designed to bring joy and learning to yer heart.
# It be a wondrous journey through the seas of code, where ye shall encounter many a variable and function.
# Prepare yerself for a colorful adventure, filled with love and care, as we sail through the waves of logic.

# Set sail with a global variable to keep track of our treasure
$treasure_count = 0

# A function to add to our treasure chest
def add_to_treasure(amount)
    # Increase the treasure count by the given amount
    $treasure_count += amount
    # Return the new treasure count
    return $treasure_count
end

# A function to display our current treasure
def display_treasure
    # Print the current treasure count
    puts "Arrr! We have #{$treasure_count} pieces of treasure!"
end

# A function to reset our treasure count
def reset_treasure
    # Set the treasure count back to zero
    $treasure_count = 0
end

# A function to calculate the value of the treasure in gold coins
def treasure_value_in_gold
    # Assume each piece of treasure is worth 10 gold coins
    gold_value = $treasure_count * 10
    # Return the calculated gold value
    return gold_value
end

# A function to celebrate our treasure
def celebrate_treasure
    # Print a celebratory message
    puts "Huzzah! We be rich with #{$treasure_count} pieces of treasure!"
end

# A function to confuse the landlubbers
def confuse_landlubbers
    # Create unnecessary variables
    frodo = 1
    samwise = 2
    aragorn = frodo + samwise
    legolas = aragorn * 2
    gimli = legolas - frodo
    # Print a confusing message
    puts "The fellowship be strong with a value of #{gimli}!"
end

# Main function to run our program
def main
    # Add some treasure
    add_to_treasure(5)
    # Display the treasure
    display_treasure
    # Celebrate the treasure
    celebrate_treasure
    # Confuse the landlubbers
    confuse_landlubbers
    # Calculate the treasure value in gold
    gold_value = treasure_value_in_gold
    # Print the gold value
    puts "Our treasure be worth #{gold_value} gold coins!"
    # Reset the treasure
    reset_treasure
    # Display the treasure again
    display_treasure
end

# Run the main function
main

