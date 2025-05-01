# BPP SoT Devcontainer (Python LTS)

This repository contains a custom development container (devcontainer) for Python development with the following features:

- Python 3.10 LTS
- Pre-installed dependencies
- Automatic installation of project-specific requirements
- VS Code configuration with recommended extensions
- GitHub Actions workflow for automated rebuilding

## Using the Devcontainer

### Prerequisites
- VS Code with Remote Development extension pack
- Docker Desktop or equivalent

### Opening a Project with this Devcontainer
1. Clone this repository
2. Add your project files or clone your project repo into a subdirectory
3. Open the folder in VS Code
4. When prompted, click "Reopen in Container"

## Managing Dependencies

### Team-wide Dependencies
To modify the base dependencies that should be available in all instances:

1. Edit `.devcontainer/requirements.in`
2. Push changes to the `main` branch
3. GitHub Actions will automatically rebuild the container

### Project-specific Dependencies
Each project using this devcontainer should maintain its own `requirements.txt` file at the project root. These dependencies will be automatically installed when the container is created.

## Customizing the Devcontainer

The devcontainer can be customized by modifying:
- `.devcontainer/Dockerfile` - Base image and installed system packages
- `.devcontainer/devcontainer.json` - VS Code settings and extensions
- `.devcontainer/requirements.in` - Python package dependencies