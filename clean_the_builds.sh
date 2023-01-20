#!/bin/bash

# Check if directory is passed as a parameter, otherwise use current directory
if [ -z "$1" ]; then
    cur_dir="$PWD"
else
    cur_dir="$1"
fi

# Arrays to store directories with pom.xml and build.gradle files
mvn_dirs=()
mvnw_dirs=()
gradle_dirs=()
gradlew_dirs=()

# Iterate through directories in the given or current directory
for dir in "$cur_dir"/*/; do
    # Check if pom.xml file exists
    if [ -f "$dir/pom.xml" ]; then
        # Check if mvnw exists
        if [ -f "$dir/mvnw" ]; then
            mvnw_dirs+=("$dir")
        else
            mvn_dirs+=("$dir")
        fi
    # Check if build.gradle file exists
    elif [ -f "$dir/build.gradle" ]; then
        # Check if gradlew exists
        if [ -f "$dir/gradlew" ]; then
            gradlew_dirs+=("$dir")
        else
            gradle_dirs+=("$dir")
        fi
    fi
done

# Calculate total number of directories
total_dirs=$((${#mvn_dirs[@]} + ${#mvnw_dirs[@]} + ${#gradle_dirs[@]} + ${#gradlew_dirs[@]}))

# Initialize counter for progress indicator
counter=0

# Print total number of directories to process
echo "Found $total_dirs directories to process"

# Iterate through mvn_dirs array and execute mvn clean command in each directory
for dir in "${mvn_dirs[@]}"; do
    counter=$((counter+1))
    echo -ne "Processing $counter/$total_dirs directories: $dir \r"
    # Change directory to current directory in iteration
    # Run mvn clean command and redirect output to /dev/null
    (cd "$dir" && mvn clean > /dev/null) && echo -ne "\033[2K\r"
done

# Iterate through mvnw_dirs array and execute ./mvnw clean command in each directory
for dir in "${mvnw_dirs[@]}"; do
    counter=$((counter+1))
    echo -ne "Processing $counter/$total_dirs directories: $dir \r"
    # Change directory to current directory in iteration
    # Run ./mvnw clean command and redirect output to /dev/null
    (cd "$dir" && ./mvnw clean > /dev/null) && echo -ne "\033[2K\r"
done

# Iterate through gradle_dirs array and execute gradle clean command in each directory
for dir in "${gradle_dirs[@]}"; do
    counter=$((counter+1))
    echo -ne "Processing $counter/$total_dirs directories: $dir \r"
    # Change directory to current directory in iteration
    # Run gradle clean command and redirect output to /dev/null
    (cd "$dir" && gradle clean > /dev/null) && echo -ne "\033[2K\r"
done

# Iterate through gradlew_dirs array and execute ./gradlew clean command in each directory
for dir in "${gradlew_dirs[@]}"; do
    counter=$((counter+1))
    echo -ne "Processing $counter/$total_dirs directories: $dir \r"
    # Change directory to current directory in iteration
    # Run ./gradlew clean command and redirect output to /dev/null
    (cd "$dir" && ./gradlew clean > /dev/null) && echo -ne "\033[2K\r"
done

echo ""
