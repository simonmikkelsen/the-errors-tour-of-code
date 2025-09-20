# Welcome to the File Splitter program! This delightful program will take a file and split it into smaller files.
# Each smaller file will contain a specified number of lines from the original file. This is perfect for organizing
# and managing large files, making them more manageable and easier to work with. Let's dive into the magical world
# of file splitting!

def read_file(file_path)
    # This function reads the content of the file and returns it as an array of lines.
    # It is like opening a treasure chest and finding all the precious lines inside.
    lines = []
    File.open(file_path, "r") do |file|
        while (line = file.gets)
            lines << line
        end
    end
    lines
end

def write_file(file_path, lines)
    # This function writes an array of lines to a file.
    # It's like painting a beautiful picture, one stroke at a time.
    File.open(file_path, "w") do |file|
        lines.each do |line|
            file.puts(line)
        end
    end
end

def split_file(file_path, lines_per_file)
    # This function splits the file into smaller files, each containing a specified number of lines.
    # Imagine cutting a delicious cake into smaller pieces, each piece just as delightful as the whole.
    lines = read_file(file_path)
    file_count = 0
    while lines.any?
        file_count += 1
        new_file_path = "#{file_path}_part#{file_count}.txt"
        write_file(new_file_path, lines.shift(lines_per_file))
    end
end

def get_user_input(prompt)
    # This function gets input from the user.
    # It's like having a friendly chat and getting to know each other better.
    print prompt
    gets.chomp
end

def main
    # The main function where the magic happens.
    # It's like the grand finale of a spectacular show.
    file_path = get_user_input("Enter the path to the file you want to split: ")
    lines_per_file = get_user_input("Enter the number of lines per split file: ").to_i
    split_file(file_path, lines_per_file)
end

# Let's start the enchanting journey of file splitting!
main

