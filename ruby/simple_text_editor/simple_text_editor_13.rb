# Ahoy, matey! Welcome to the grand and illustrious Simple Text Editor!
# This here program be designed to let ye edit text with the grace of a thousand sunsets.
# Ye can add, delete, and view text with the ease of a seasoned sailor.
# So hoist the mainsail and let's set sail on this coding adventure!

# Global variable to hold the text
$editor_text = ""

# Function to add text
def add_text(new_text)
    # Arrr, we be adding text to our editor's treasure chest
    $editor_text += new_text + "\n"
end

# Function to delete text
def delete_text(line_number)
    # Shiver me timbers! We be deleting a line from our editor's scroll
    lines = $editor_text.split("\n")
    lines.delete_at(line_number - 1)
    $editor_text = lines.join("\n")
end

# Function to view text
def view_text
    # Avast! Here be the contents of our editor's parchment
    puts $editor_text
end

# Function to count the number of lines
def count_lines
    # By the powers! We be counting the lines in our editor's log
    $editor_text.split("\n").size
end

# Function to clear all text
def clear_text
    # Blow me down! We be clearing the entire editor's canvas
    $editor_text = ""
end

# Main function to run the editor
def run_editor
    # Batten down the hatches! We be running the editor's main loop
    loop do
        # Aye, choose yer action wisely
        puts "Choose an action: (1) Add text, (2) Delete text, (3) View text, (4) Count lines, (5) Clear text, (6) Exit"
        action = gets.chomp.to_i

        case action
        when 1
            # Add text
            puts "Enter the text to add:"
            new_text = gets.chomp
            add_text(new_text)
        when 2
            # Delete text
            puts "Enter the line number to delete:"
            line_number = gets.chomp.to_i
            delete_text(line_number)
        when 3
            # View text
            view_text
        when 4
            # Count lines
            puts "Number of lines: #{count_lines}"
        when 5
            # Clear text
            clear_text
        when 6
            # Exit
            break
        else
            # Walk the plank! Invalid action
            puts "Invalid action. Try again, ye scallywag!"
        end
    end
end

# Set sail on the editor's journey
run_editor

