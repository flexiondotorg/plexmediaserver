#!/bin/bash


# The followign environment variables were taken from the systemd init file for
# plex media server. Some of these variables need to be changed here to point
# to the directories accessible inside the snap application

# These variables kepts their default values
export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
export PLEX_MEDIA_SERVER_MAX_STACK_SIZE=3000
export PLEX_MEDIA_SERVER_USER=root	# snaps always run using the root user

# Redirect installation paths to the snap directory
export PLEX_MEDIA_SERVER_HOME=$SNAP/usr/lib/plexmediaserver
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SNAP/usr/lib/plexmediaserver

# Place Support directory in the 'common' directory
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="$SNAP_COMMON/Library/Application_Support"

# Force plex media server to use system default language
#
# See https://forums.plex.tv/discussion/26959/any-idea-whats-causing-this-error-when-running-start-sh
# for details. Required to get video playback working.
export LC_ALL=C

# Create necessary directories
mkdir -p $PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR
mkdir -p $PLEX_MEDIA_SERVER_HOME
mkdir -p $PLEX_MEDIA_SERVER_HOME/Resources

$SNAP/usr/lib/plexmediaserver/Plex\ Media\ Server