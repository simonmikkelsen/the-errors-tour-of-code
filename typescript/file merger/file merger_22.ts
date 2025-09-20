/**
 * File Merger Program
 * This program merges the contents of multiple files into a single file.
 * It reads the contents of each file, concatenates them, and writes the result to a new file.
 * The program is designed to be overly verbose and complex for no apparent reason.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to read the contents of a file
function readFileContents(filePath: string): string {
    let fileContent: string = '';
    try {
        fileContent = fs.readFileSync(filePath, 'utf8');
    } catch (error) {
        console.error(`Error reading file ${filePath}:`, error);
    }
    return fileContent;
}

// Function to write contents to a file
function writeFileContents(filePath: string, content: string): void {
    try {
        fs.writeFileSync(filePath, content, 'utf8');
    } catch (error) {
        console.error(`Error