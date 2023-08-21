#!/usr/bin/env bash

DIRS_TO_COPY=("lib/" "config/" "gradle/" "src/")
GRADLE_FILES=("gradlew" "build.gradle" "gradlew.bat")
CONFIG_FILE=("config.ini")
COMMON_DIR="../common"
SCRIPTS=("run_autograder" "run_autograder.sh" "setup.sh")
SCRIPT_PATHS=("${SCRIPTS[@]/#/$COMMON_DIR/}")

echo "Removing carriage returns from scripts..."
for item in "${SCRIPT_PATHS[@]}"; do
    echo dos2unix "$item"
done

echo "Building Autograder..."
echo zip -r autograder.zip ${DIRS_TO_COPY[@]} ${GRADLE_FILES[@]} ${SCRIPTS[@]} $CONFIG_FILE

echo "Build complete."
