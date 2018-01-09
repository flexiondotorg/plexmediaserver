#!/bin/bash

# The following environment variables were taken from the systemd init file for
# plex media server. Some of these variables need to be changed here to point
# to the directories accessible inside the snap application

# These variables kepts their default values
export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
export PLEX_MEDIA_SERVER_MAX_STACK_SIZE=3000
export PLEX_MEDIA_SERVER_USER=root	# snaps always run using the root user

# Redirect installation paths to the snap directory
export PLEX_MEDIA_SERVER_HOME="$SNAP/usr/lib/plexmediaserver"
export LD_LIBRARY_PATH="${PLEX_MEDIA_SERVER_HOME}":$LD_LIBRARY_PATH

# Plex config directory is placed in the common directory because this can
# contain GBs of data
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="$SNAP_COMMON/Library/Application_Support"

# Force plex media server to use system default language
# Required to get video playback working.
# See https://forums.plex.tv/discussion/26959/any-idea-whats-causing-this-error-when-running-start-sh
# for details.
export LC_ALL=C.UTF-8

# The tmp directory is where the mediaserver stores the transcodes
# Place the tmp directory in the common directory
export TMPDIR="$SNAP_COMMON/tmp"
export PLEX_MEDIA_SERVER_TMPDIR="$TMPDIR"

# Use syslog for logging instead of sending logs to Plex Media Server.log
export PLEX_MEDIA_SERVER_USE_SYSLOG=true

# Create necessary directories
mkdir -p "$PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR"
mkdir -p "$PLEX_MEDIA_SERVER_HOME/Resources"
mkdir -p "$TMPDIR"

(cd "$PLEX_MEDIA_SERVER_HOME"; ./Plex\ Media\ Server)
