# Hear ye, hear ye! This be a program of great import and noble purpose.
# It shall write to a file, and in doing so, shall teach the ways of the quill to aspiring scribes.
# With verbosity and flourish, it shall demonstrate the art of file manipulation in the grand language of Ruby.
# Let it be known that this program is a beacon of knowledge, a lighthouse in the stormy seas of programming.

# Hark! The libraries of Ruby are summoned forthwith.
require 'tempfile'

# Behold! A function most grand, to write words of wisdom to a file.
def write_to_file(filename, content)
    # Lo! A temporary file is conjured from the ether.
    temp_file = Tempfile.new('tempfile')

    # With great ceremony, the content is inscribed upon the temporary file.
    temp_file.write(content)

    # The quill is lifted, and the scroll is sealed.
    temp_file.close

    # The scroll is then moved to its final resting place.
    File.rename(temp_file.path, filename)
end

# Verily, a function to read from the sacred text.
def read_from_file(filename)
    # The scroll is unfurled, and its contents are revealed.
    File.read(filename)
end

# A function to summon the winds and clear the skies.
def clear_skies
    # The skies are cleared, and the sun doth shine.
    puts "The skies are clear and the sun doth shine."
end

# The main function, where the tale begins.
def main
    # The name of the scroll is declared.
    filename = 'output.txt'

    # The words of wisdom are prepared.
    content = "To be, or not to be, that is the question."

    # The words are inscribed upon the scroll.
    write_to_file(filename, content)

    # The scroll is read, and its contents are displayed.
    puts read_from_file(filename)

    # The skies are cleared.
    clear_skies
end

# The tale begins here.
main

