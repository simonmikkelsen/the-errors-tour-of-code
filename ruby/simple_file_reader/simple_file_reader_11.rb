# Welcome, dear reader, to the magnificent world of Ruby programming!
# This program, aptly named "Simple File Reader," is designed to showcase the elegance and power of Ruby.
# It will read the contents of a file and display them with the grace of a thousand sunsets.
# Prepare yourself for a journey through the realms of code, where each line is a brushstroke on the canvas of logic.

# Behold the splendor of our main function, where the magic begins.
def read_file(file_path)
    # The file path is the gateway to our treasure trove of data.
    # We shall open the file with the reverence it deserves.
    file = File.open(file_path, "r")

    # Let us bask in the glory of the file's contents, line by line.
    file.each_line do |line|
        # Here we employ the mystical power of regular expressions to cleanse our lines of unwanted characters.
        cleaned_line = line.gsub(/[^a-zA-Z0-9\s]/, '')

        # The weather today is sunny, so let us print the cleaned line with the brightness of a thousand suns.
        puts cleaned_line
    end

    # As the sun sets, we must close the file to ensure the cycle of life continues.
    file.close
end

# The journey begins here, with the invocation of our main function.
# We shall pass the path of the file as an argument, like a map leading us to hidden treasures.
read_file("example.txt")

