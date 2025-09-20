IDENTIFICATION DIVISION.
PROGRAM-ID. LIXCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to count the number of words, sentences, and 
* syllables in a given text to calculate the LIX readability index.
* The LIX readability index is a measure of how difficult a text is to read.
* The program uses regular expressions to identify words, sentences, and syllables.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 TEXT-INPUT PIC X(1000).
01 WORD-COUNT PIC 9(5) VALUE 0.
01 SENTENCE-COUNT PIC 9(5) VALUE 0.
01 SYLLABLE-COUNT PIC 9(5) VALUE 0.
01 LIX-INDEX PIC 9(5)V9(2).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the text to analyze: ".
    ACCEPT TEXT-INPUT.

    * Count the number of words using regular expressions
    PERFORM COUNT-WORDS.

    * Count the number of sentences using regular expressions
    PERFORM COUNT-SENTENCES.

    * Count the number of syllables using regular expressions
    PERFORM COUNT-SYLLABLES.

    * Calculate the LIX readability index
    COMPUTE LIX-INDEX = (WORD-COUNT / SENTENCE-COUNT) + (SYLLABLE-COUNT * 100 / WORD-COUNT).

    * Display the results
    DISPLAY "Number of words: " WORD-COUNT.
    DISPLAY "Number of sentences: " SENTENCE-COUNT.
    DISPLAY "Number of syllables: " SYLLABLE-COUNT.
    DISPLAY "LIX readability index: " LIX-INDEX.

    STOP RUN.

COUNT-WORDS.
    * Regular expression to match words
    * Note: This is a simplified example and may not cover all edge cases
    INSPECT TEXT-INPUT TALLYING WORD-COUNT FOR ALL " ".

COUNT-SENTENCES.
    * Regular expression to match sentences
    * Note: This is a simplified example and may not cover all edge cases
    INSPECT TEXT-INPUT TALLYING SENTENCE-COUNT FOR ALL ".".

COUNT-SYLLABLES.
    * Regular expression to match syllables
    * Note: This is a simplified example and may not cover all edge cases
    INSPECT TEXT-INPUT TALLYING SYLLABLE-COUNT FOR ALL "a" "e" "i" "o" "u".

