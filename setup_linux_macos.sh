#!/bin/bash

# https://drive.google.com/file/d/1JELbc7aVMeOimwAIRj63SiDZRukeLNGA/view

FILE_ID="1JELbc7aVMeOimwAIRj63SiDZRukeLNGA"
OUTPUT_DIR="data"
OUTPUT_FILE="${OUTPUT_DIR}/dataset_mood_smartphone.csv"
VENV_DIR=".venv"

# Create virtual environment if it doesn't exist
if [ ! -d "${VENV_DIR}" ]; then
    echo "Creating virtual environment..."
    python3 -m venv "${VENV_DIR}"
fi

# Activate virtual environment
source "${VENV_DIR}/bin/activate"

pip install -r requirements.txt

# Install gdown if not available
if ! command -v gdown &> /dev/null; then
    echo "Installing gdown..."
    pip install gdown
fi

mkdir -p "${OUTPUT_DIR}"

if [ -f "${OUTPUT_FILE}" ]; then
    echo "File ${OUTPUT_FILE} already exists. Skipping download."
    exit 0
fi

echo "Downloading dataset..."
gdown "${FILE_ID}" -O "${OUTPUT_FILE}"
echo "Download completed. File saved to ${OUTPUT_FILE}."
