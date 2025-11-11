#!/bin/sh

filesdir="${1}"
searchstr="${2}"

if [ $# -ne 2 ]
then
    echo "no of args are not 2"
    exit 1
elif [ ! -d "${filesdir}" ]
then
    echo ""${filesdir}" is not a directory"
    exit 1
fi

# Count the number of files (including subdirectories)
X=$(find "${filesdir}" -type f | wc -l)

# Count the number of matching lines across all files
Y=$(grep -r "${searchstr}" "${filesdir}" 2>/dev/null | wc -l)

# Print the result
echo "The number of files are $X and the number of matching lines are $Y"
