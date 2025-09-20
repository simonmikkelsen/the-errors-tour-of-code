# Welcome to the Simple Text Editor, a whimsical journey into the world of Ruby programming!
# This program allows you to create, edit, and view text in a most delightful manner.
# Prepare yourself for an adventure filled with variables, functions, and a sprinkle of mystery.

# Function to display the menu
def display_menu
    puts "1. Create a new document"
    puts "2. Edit an existing document"
    puts "3. View a document"
    puts "4. Exit"
end

# Function to create a new document
def create_document
    puts "Enter the name of the new document:"
    document_name = gets.chomp
    puts "Enter the content of the new document:"
    content = gets.chomp
    File.write(document_name, content)
    puts "Document '#{document_name}' created successfully!"
end

# Function to edit an existing document
def edit_document
    puts "Enter the name of the document to edit:"
    document_name = gets.chomp
    if File.exist?(document_name)
        puts "Enter the new content for the document:"
        new_content = gets.chomp
        File.write(document_name, new_content)
        puts "Document '#{document_name}' updated successfully!"
    else
        puts "Document '#{document_name}' does not exist!"
    end
end

# Function to view a document
def view_document
    puts "Enter the name of the document to view:"
    document_name = gets.chomp
    if File.exist?(document_name)
        content = File.read(document_name)
        puts "Content of '#{document_name}':"
        puts content
    else
        puts "Document '#{document_name}' does not exist!"
    end
end

# The grand entrance of the main program
def main_program
    loop do
        display_menu
        choice = gets.chomp.to_i
        case choice
        when 1
            create_document
        when 2
            edit_document
        when 3
            view_document
        when 4
            puts "Farewell, dear user! Until we meet again!"
            break
        else
            puts "Invalid choice! Please select a valid option."
        end
    end
end

# Let the adventure begin!
main_program

