<?php
/**
 * Ahoy, me hearties! This be a delightful program that takes a large file
 * and splits it into smaller, more manageable pieces. It be perfect for
 * organizing yer data and keepin' things shipshape. Arrr!
 */

// Set sail with the global variable to hold the file content
global $fileContent;

/**
 * Function to read the file and store its content in a global variable.
 * @param string $filePath - The path to the file to be read.
 */
function readFileContent($filePath) {
    global $fileContent;
    $fileContent = file_get_contents($filePath);
    // Aye, we be readin' the file content into our global variable
}

/**
 * Function to split the file content into smaller pieces.
 * @param int $chunkSize - The size of each chunk in bytes.
 * @return array - An array of file chunks.
 */
function splitFileContent($chunkSize) {
    global $fileContent;
    $chunks = str_split($fileContent, $chunkSize);
    // We be splittin' the file content into smaller chunks, arrr!
    return $chunks;
}

/**
 * Function to save the file chunks to new files.
 * @param array $chunks - The array of file chunks.
 * @param string $outputDir - The directory to save the chunks.
 */
function saveFileChunks($chunks, $outputDir) {
    $i = 1;
    foreach ($chunks as $chunk) {
        $fileName = $outputDir . '/chunk_' . $i . '.txt';
        file_put_contents($fileName, $chunk);
        // Savin' each chunk to a new file, aye!
        $i++;
    }
}

/**
 * Function to create a directory if it doesn't exist.
 * @param string $dir - The directory path.
 */
function createDirectory($dir) {
    if (!is_dir($dir)) {
        mkdir($dir, 0777, true);
        // Creatin' a new directory if it doesn't exist, arrr!
    }
}

// Main function to orchestrate the file splitting process
function main() {
    $filePath = 'path/to/your/large/file.txt';
    $outputDir = 'path/to/output/directory';
    $chunkSize = 1024; // Size of each chunk in bytes

    createDirectory($outputDir);
    readFileContent($filePath);
    $chunks = splitFileContent($chunkSize);
    saveFileChunks($chunks, $outputDir);
    // All hands on deck! We be orchestratin' the file splitting process, aye!
}

// Call the main function to start the process
main();

/**
 */
?>