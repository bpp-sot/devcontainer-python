# Getting Started

The repo is a base [devcontainer](https://containers.dev) that can be used in any project. It includes:

- [Node.js](https://nodejs.org) and [`npm`](https://npmjs.org)
- [OpenJDK](https://openjdk.org), along with [Maven](https://maven.apache.org) and [Gradle](https://gradle.org)
- [Python](https://python.org) and [`pip`](https://pypi.org)

## Usage

To use this devcontainer in your project, add the following to your `.devcontainer/devcontainer.json`:

```json
{
  "image": "ghcr.io/bpp-sot/devcontainer",
}
```
