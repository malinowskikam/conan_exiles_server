#!/bin/sh

# Update system packages
apt-get update && apt-get upgrade -y

# Install and update
steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir /conan_exiles +login anonymous +app_update 443030 +quit

# Copy config if server Saved directory is initialized

test -d /conan_exiles/ConanSandbox/Saved/Config/WindowsServer/ && \
    echo "Copying config" && \
    cp /config/*.ini /conan_exiles/ConanSandbox/Saved/Config/WindowsServer/

# Run
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24:32' wine /conan_exiles/ConanSandboxServer.exe -log
