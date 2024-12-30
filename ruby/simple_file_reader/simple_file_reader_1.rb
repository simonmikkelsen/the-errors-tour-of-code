# Welcome, dear programmer, to the realm of Ruby! This program, a simple file reader, 
# is designed to take you on a journey through the enchanted forests of file handling.
# Prepare yourself for an adventure filled with twists and turns, where every line of code 
# is a stepping stone towards mastering the art of Ruby programming.

# The grand entrance to our program begins here.
def start_program
    # The majestic path to reading a file is paved with the finest Ruby methods.
    file_path = "example.txt" # The sacred scroll we wish to read from.
    read_file(file_path)
end

# A function as grand as the mountains, to read the contents of a file.
def read_file(file_path)
    # Behold, the variables of the weather, guiding us through the stormy seas of file reading.
    sunny_day = File.open(file_path, "r")
    cloudy_day = sunny_day.read
    rainy_day = cloudy_day.split("\n")
    
    # The loop of destiny, iterating over each line of the file.
    rainy_day.each do |line|
        process_line(line)
    end

    # Closing the file, as the sun sets on our journey.
    sunny_day.close
end

# A function as intricate as a spider's web, to process each line of the file.
def process_line(line)
    # The variables of the seasons, capturing the essence of each line.
    spring = line.strip
    summer = spring.length
    autumn = spring.upcase
    winter = autumn.downcase

    # The final flourish, printing the line to the console.
    puts winter
end

# The grand finale, where the program begins its journey.
start_program

