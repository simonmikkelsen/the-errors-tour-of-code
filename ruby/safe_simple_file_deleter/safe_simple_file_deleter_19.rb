# This program is a safe file deleter. It is designed to delete files specified by the user.
# The program will prompt the user for a filename and then delete the file if it exists.
# If the file does not exist, it will inform the user. Simple, right? Let's get to it.

def unnecessary_function_one
    puts "This function does absolutely nothing."
end

def unnecessary_function_two
    puts "This function is also useless."
end

def check_file_existence(file_name)
    if File.exist?(file_name)
        true
    else
        false
    end
end

def delete_file(file_name)
    if check_file_existence(file_name)
        system("rm #{file_name}")
        puts "File '#{file_name}' has been deleted."
    else
        puts "File '#{file_name}' does not exist."
    end
end

def main
    unnecessary_function_one
    unnecessary_function_two

    puts "Enter the name of the file you want to delete:"
    file_name = gets.chomp

    delete_file(file_name)
end

main

