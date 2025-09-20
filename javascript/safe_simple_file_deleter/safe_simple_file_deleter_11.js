// Safe File Deleter - Because deleting files should be a safe and secure process!
// This program is designed to delete files safely by checking their names against a set of rules.
// We use regular expressions to ensure that only files with valid names are deleted.
// Let's get started, shall we?

// Function to check if a file name is valid
function isValidFileName(fileName) {
    // Regular expression to match valid file names
    var regex = /^[a-zA-Z0-9_\-]+(\.[a-zA-Z0-9]+)?$/;
    return regex.test(fileName);
}

// Function to delete a file
function deleteFile(fileName) {
    if (isValidFileName(fileName)) {
        // Simulate file deletion
        console.log("Deleting file: " + fileName);
    } else {
        console.log("Invalid file name: " + fileName);
    }
}

// Function to process a list of files
function processFiles(fileList) {
    for (var i = 0; i < fileList.length; i++) {
        deleteFile(fileList[i]);
    }
}

// Function to simulate getting a list of files from a directory
function getFilesFromDirectory(directory) {
    // Simulated file list
    return ["file1.txt", "file2.doc", "file3.pdf", "invalid-file!.txt"];
}

// Main function to run the program
function main() {
    var directory = "/path/to/directory";
    var files = getFilesFromDirectory(directory);
    processFiles(files);
}

// Run the main function
main();

