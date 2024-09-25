#!/bin/sh

DIRECTORY="$PWD/target/cucumber-html-reports"

# Portal assumes report will be called index.html
if [ -f "$DIRECTORY/overview-features.html" ]; then
    cp "$DIRECTORY/overview-features.html" "$DIRECTORY/index.html"
fi

echo "Publishing test results to S3"

if [ -n "$RESULTS_OUTPUT_S3_PATH" ]; then
   if [ -d "$DIRECTORY" ]; then
      aws s3 cp "$DIRECTORY" "$RESULTS_OUTPUT_S3_PATH" --recursive
      echo "Test results published to $RESULTS_OUTPUT_S3_PATH"
   else
      echo "$DIRECTORY is not found"
      exit 1
   fi
else
   echo "RESULTS_OUTPUT_S3_PATH is not set"
   exit 1
fi
