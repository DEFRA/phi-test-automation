#!/bin/sh

echo "run_id: $RUN_ID"
mvn clean
mvn verify
mvn install

test_exit_code=$?

./bin/publish-tests.sh
publish_exit_code=$?

if [ $publish_exit_code -ne 0 ]; then
  echo "failed to publish test results"
  exit $publish_exit_code
fi

exit $test_exit_code
