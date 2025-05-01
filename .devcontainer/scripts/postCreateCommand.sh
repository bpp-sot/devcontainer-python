#!/bin/bash

# Make script exit on first error
set -e

# Check if project's requirements.txt exists and install from it
if [ -f "/workspace/requirements.txt" ]; then
    echo "Installing dependencies from project's requirements.txt..."
    pip install -r /workspace/requirements.txt
else
    echo "No requirements.txt found in project root. Skipping package installation."
fi

# Setup git config if needed
if [ ! -z "${GIT_USER_NAME}" ] && [ ! -z "${GIT_USER_EMAIL}" ]; then
    echo "Setting up git configuration..."
    git config --global user.name "${GIT_USER_NAME}"
    git config --global user.email "${GIT_USER_EMAIL}"
fi

# Generate a persistent bash history
HISTFILE=/workspace/.bash_history
echo "export HISTFILE=/workspace/.bash_history" >> ~/.bashrc
echo "export PROMPT_COMMAND='history -a'" >> ~/.bashrc

echo "Devcontainer setup complete!"