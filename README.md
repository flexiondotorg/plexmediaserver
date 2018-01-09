# Plex Media Server snap

Proof of concept snap for [Plex media server](https://plex.tv)

Plex makes it possible to enjoy all of your media, whether in your living
room, the car, or on a boat in the South Pacific!

## Install

**THIS SNAP IS NOT PUBLISHED IN THE STORE, BUT IF IT WERE THE FOLLOWING WOULD APPLY**

Installing a snap package is the easiest thing in the world. To install this
snap just enter the following command:

    snap install plexmediaserver

That is it! The plexmediaserver is now installed and already running on the
background. Start managing your media by point a webrowser at
http://localhost:32400/manage

You can check this status of Plex with the following command:

    systemctl status snap.plexmediaserver.plexmediaserver

### Accessing data from external drives

**A STORE ASSERTION CAN BE ADDED TO AUTOMATICALLY CONNECT `removable-media`**

Snap are confined and present limited access to the host. By default, a snap
does not have permission to access external drives. To fix this you need to
enter an extra command:

    sudo snap connect plexmediaserver:removable-media

After entering this command the plexmediaserver will be able to access any
data inside the `/media/` directory (where external drives are usually mounted).

## Building this snap

Using Ubuntu 16.04 or newer do the following:

```
sudo snap install snapcraft --classic
sudo snap install lxd
sudo lxd init
git clone https://github.com/flexiondotorg/plexmediaserver.git
cd plexmediaserver
snapcraft cleanbuild
```

The `plexmediaserver` snap will be built in a clean LXD container running 
Ubuntu 16.04 and depositied in the current working directory. That snap can 
then be installed using:

    sudo snap install plexmediaserver_1.10.1.4602-f54242b6b_amd64.snap --dangerous
