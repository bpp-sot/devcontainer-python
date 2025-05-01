# Use the latest Python LTS version
FROM python:3.10-bullseye

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get -y install git procps lsb-release vim curl wget \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog

# Install pip-tools
RUN pip install --no-cache-dir pip-tools

# Set up a non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Create a working directory with appropriate permissions
WORKDIR /workspace
RUN chown $USER_UID:$USER_GID /workspace

# Copy requirements.in file containing the team's base dependencies
COPY requirements.in /tmp/requirements.in

# Generate and install base requirements
RUN pip-compile /tmp/requirements.in --output-file=/tmp/requirements.txt \
    && pip install --no-cache-dir -r /tmp/requirements.txt

# Switch to non-root user
USER $USERNAME

# Set up better Python defaults
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1