# Unofficial Bitpingd Docker Container 🚀
![Docker Pulls](https://img.shields.io/docker/pulls/mrcolorrain/bitping?link=https%3A%2F%2Fhub.docker.com%2Fr%2Fmrcolorrain%2Fbitping)
![Docker Stars](https://img.shields.io/docker/stars/mrcolorrain/bitping?link=https%3A%2F%2Fhub.docker.com%2Fr%2Fmrcolorrain%2Fbitping)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/MRColorR/bitping/docker-build.yml?link=https%3A%2F%2Fhub.docker.com%2Fr%2Fmrcolorrain%2Fbitping)

🌟 **If you find this project helpful, please consider leaving a star. Your support is appreciated!🙂** 

## Introduction 📖

This repository contains the Dockerfile and configuration for an unofficial, containerized version of the [Bitping](https://app.bitping.com/?r=qm7mIuX3) software. It's designed to facilitate the deployment of Bitping in Docker environments, supporting both x86_64 and arm64 architectures.

## Features ✨
- **Debian slim Base Image**: Utilizes the latest version of Debian slim for a small footprint.
- **Multi-Architecture Support**: Supports x86_64, arm64 and armv7 architectures.
- **Bitpingd and Bitping-node**: Includes both `bitpingd` service.
- **Tini and Supervisor Integration**: Ensures proper startup and management of services using `tini` as the init system and `supervisor` for process control.
- **Automated Download and Setup**: Automatically downloads and sets up the Bitping node.

## Prerequisites 📋
Ensure Docker is installed on your system. For installation instructions, please refer to the [official Docker documentation](https://docs.docker.com/get-docker/).

## Quick Start 🚀
You can run it easily passing the appropriate environment variables.
- ### Docker cli 🐳
  You can run the container using:
  ```bash
  docker run -d -p -e BITPING_EMAIL='<your@email>' -e BITPING_PASSWD='<yourpassword>' -v "./.data/.bitpingd:/root/.bitpingd" --name bitping_container mrcolorrain/bitping
  ```

## Contributing 🤲
Your contributions are welcome! If you'd like to improve the project or fix a bug, please fork the repository and submit a pull request. Let's make this project even better, together!

## Disclaimer ⚠️
This is an unofficial build and not affiliated or officially endorsed by Bitping.
This repository (project) and its assets are provided "as is" without warranty of any kind.
The author makes no warranties, express or implied, that this project and its assets are free of errors, defects, or suitable for any particular purpose.
The author shall not be liable for any damages suffered by any user of this project, whether direct, indirect, incidental, consequential, or special, arising from the use of or inability to use this project, its assets or its documentation, even if the author has been advised of the possibility of such damages.

## Want more? 💵📈
This image is also part of Money4Band, a free open-source project that runs various passive income apps in a safe, containerized environment. Turn your unused internet bandwidth into earnings! Why let your unused internet bandwidth go to waste? Start earning today! Check out the Money4Band project on [here](https://github.com/MRColorR/money4band) GitHub to get started.
