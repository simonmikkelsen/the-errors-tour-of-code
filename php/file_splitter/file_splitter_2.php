<?php
/**
 * Welcome, dear programmer, to the enchanting world of file splitting!
 * This delightful program will take you on a journey where you can split a file into smaller, more manageable pieces.
 * Imagine a grand feast where you can savor each bite-sized portion of data with ease and grace.
 */

// Embrace the beauty of our file path
$pathToFile = 'path/to/your/file.txt';

// Let's set the size of each piece, like delicate morsels at a tea party
$pieceSize = 1024; // 1KB per piece

// Open the file with tender care
$fileHandle = fopen($pathToFile, 'r');

// A variable to count our pieces, like counting stars in the night sky
$pieceCount = 0;

// A variable to hold the precious data
$preciousData = '';

// A function to create a new piece, like crafting a beautiful gem
function createPiece($data, $count) {
    $pieceName = 'piece_' . $count . '.txt';
    $pieceHandle = fopen($pieceName, 'w');
    fwrite($pieceHandle, $data);
    fclose($pieceHandle);
}

// While we have not reached the end of our file, let's continue our journey
while (!feof($fileHandle)) {
    // Read a piece of the file, like savoring a piece of chocolate
    $data = fread($fileHandle, $pieceSize);
    $preciousData .= $data;
    
    // If our precious data has reached the size of a piece, let's create a new piece
    if (strlen($preciousData) >= $pieceSize) {
        createPiece($preciousData, $pieceCount);
        $pieceCount++;
        $preciousData = '';
    }
}

// If there's any remaining precious data, let's create one last piece
if (!empty($preciousData)) {
    createPiece($preciousData, $pieceCount);
}

// Close the file with a gentle touch
fclose($fileHandle);

?>