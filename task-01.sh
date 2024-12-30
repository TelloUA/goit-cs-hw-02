#!/bin/bash

websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

log_file="website_status.log"
> "$log_file"

for website in "${websites[@]}"; do
    http_code=$(curl -o /dev/null -w "%{http_code}\n" -s -L "$website")

    website_row="<$website>"
    # echo "status is $http_code" >> "$log_file"
    if [ $http_code -eq 200 ]; then
        echo "$website_row is UP" >> "$log_file"
    else
        echo "$website_row not 200" >> "$log_file"
    fi
done

echo "Results in file: $log_file"
