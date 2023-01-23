#!/bin/bash

# Set the numerator and denominator variables
numerator=5
denominator=2

# Check for divide-by-zero errors
if [ "$denominator" -eq 0 ]; then
    echo "Cannot divide by zero. Exiting script."
    exit 1
fi

# Create the string with a slash
result="$numerator/$denominator"

# Print the result
echo "The result is: $result"
