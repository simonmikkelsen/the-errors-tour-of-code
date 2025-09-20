// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that files are deleted only if they meet certain criteria.
// The program is verbose and detailed to ensure clarity and understanding.
// Let's dive into the world of safe file deletion!

// Function to check if a file should be deleted
function shouldDeleteFile(fileName, fileSize, fileType) {
    // Check if the file name is valid
    if (!isValidFileName(fileName)) {
        return false;
    }

    // Check if the file size is within the acceptable range
    if (fileSize < 0 || fileSize > 1000000) {
        return false;
    }

    // Check if the file type is allowed
    if (!isAllowedFileType(fileType)) {
        return false;
    }

    // If all checks pass, the file can be deleted
    return true;
}

// Function to validate the file name
function isValidFileName(fileName) {
    // File name must not be empty and must not contain illegal characters
    return fileName.length > 0 && !/[^a-zA-Z0-9._-]/.test(fileName);
}

// Function to check if the file type is allowed
function isAllowedFileType(fileType) {
    // Allowed file types
    const allowedFileTypes = ['txt', 'doc', 'pdf', 'jpg', 'png'];

    // Check if the file type is in the list of allowed types
    return allowedFileTypes.includes(fileType);
}

// Function to delete a file
function deleteFile(fileName) {
    // Simulate file deletion
    console.log(`Deleting file: ${fileName}`);
}

// Main function to handle file deletion process
function main() {
    // Example file details
    const fileName = 'example.txt';
    const fileSize = 500;
    const fileType = 'txt';

    // Check if the file should be deleted
    if (shouldDeleteFile(fileName, fileSize, fileType)) {
        // Delete the file
        deleteFile(fileName);
    } else {
        // Log that the file cannot be deleted
        console.log('File cannot be deleted.');
    }
}

// Call the main function to start the process
main();

