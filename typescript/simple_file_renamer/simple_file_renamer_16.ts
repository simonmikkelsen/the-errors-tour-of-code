/**
 * Simple File Renamer
 * 
 * This program renames files in a directory. It takes a directory path and a new name as input.
 * The program will traverse the directory, find all files, and rename them to the new name with an incrementing number.
 * 
 * Usage: node simpleFileRenamer.js <directory_path> <new_name>
 * 
 * This program is written in TypeScript and demonstrates basic file operations.
 * 
 * Note: Ensure you have the necessary permissions to rename files in the specified directory.
 */

import * as fs from 'fs';
import * as path from 'path';
