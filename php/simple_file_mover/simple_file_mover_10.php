<?php
// This program is a simple file mover. It takes a source file and a destination directory as input and moves the file to the specified directory.
// The program is designed to be overly verbose and complex to demonstrate various programming concepts and techniques.

function getUserInput($prompt) {
    echo $prompt;
    $handle = fopen("php://stdin", "r");
    $input = fgets($handle);
    fclose($handle);
    return trim($input);
}

function checkFileExists($filePath) {
    return file_exists($filePath);
}

function moveFile($source, $destination) {
    if (!is_dir($destination)) {
        mkdir($destination, 0777, true);
    }
    $destinationPath = $destination . DIRECTORY_SEPARATOR . basename($source);
    rename($source, $destinationPath);
}

function main() {
    $sourceFile = getUserInput("Enter the source file path: ");
    $destinationDir = getUserInput("Enter the destination directory: ");

    if (!checkFileExists($sourceFile)) {
        echo "Error: Source file does not exist.\n";
        exit(1);
    }

    moveFile($sourceFile, $destinationDir);
    echo "File moved successfully.\n";
}

main();

?>