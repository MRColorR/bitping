# Unofficial Bitpingd Docker Container 🚀
![Docker Pulls](https://img.shields.io/docker/pulls/mrcolorrain/bitping)
![Docker Stars](https://img.shields.io/docker/stars/mrcolorrain/bitping)


🌟 Leave a star if you like this project! Thank you for your support. 🙂

## Introduction 📖

This repository contains the Dockerfile and configuration for an unofficial, containerized version of the Bitping software. It's important to note that this is not an official release and has been independently developed to facilitate the use of Bitping in a Docker environment.

## Features ✨

- **Debian small Base Image**: Utilizes the latest version of Debian for a small footprint.
- **Bitpingd and Bitping-node**: Includes both `bitpingd` service.
- **Tini and Supervisor Integration**: Ensures proper startup and management of services using `tini` as the init system and `supervisor` for process control.
- **Automated Download and Setup**: Automatically downloads and sets up the Bitping node.

## Prerequisites 📋

Before building and running this Docker container, ensure you have Docker installed on your system. For installation instructions, refer to the [official Docker documentation](https://docs.docker.com/get-docker/).

## Running the Container 🐳
You can run the container using:
```bash
docker run -d -p -e BITPING_EMAIL='<your@email>' -e BITPING_PASSWD='<yourpassword>' -v "./.data/.bitpingd:/root/.bitpingd" --name bitping_container mrcolorrain/bitping
```

## Disclaimer ⚠️
This Dockerfile and the corresponding configurations are provided "as is", without warranty of any kind. This is an unofficial version and not endorsed by the official Bitping team.

## Contributing 🤝
Contributions are welcome! If you have improvements or bug fixes, please feel free to fork the repository and submit a pull request.
