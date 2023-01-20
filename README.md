# Clean Builds Script

This script is used to run the clean command for maven and gradle in all subdirectories one level deep from the provided/current directory that contain a pom.xml or build.gradle file.

## Usage
1. Download the script to your local machine
2. Make the script executable by running `chmod +x clean_builds.sh`
3. Run the script by executing `./clean_builds.sh [directory]`

The script accepts an optional parameter of a directory. If a directory is not passed, the script will use the current working directory.

## Requirements
* bash
* maven (If there are maven based projects)
* gradle (if there are gradle based projects)

## Features
* The script checks for maven wrapper and gradle wrapper and uses them if available instead of plain maven and gradle.
* A progress indicator is included to track the progress of the cleaning process.
* The script hides maven and gradle outputs.
* The script tracks only directories that contain either pom.xml or build.gradle files.
* If cleaning is not successful, the script will continue, but it will show the error output.

## How it works
The script looks for subdirectories in the given or current directory that contain a pom.xml or build.gradle file. It then separates these directories into four arrays: mvn_dirs, mvnw_dirs, gradle_dirs, gradlew_dirs. The script then iterates through each array and runs the appropriate clean command (mvn clean, ./mvnw clean, gradle clean, or ./gradlew clean) in each directory. The script also keeps track of the progress and the total number of directories processed.

## Note
The script will only clean subdirectories one level deep from the provided/current directory. It will not clean nested subdirectories.

## Usefulness
This script can be useful when projects should be moved from one place to another because it can reduce the projects directories sizes.
