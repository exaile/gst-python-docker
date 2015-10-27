gst-python-docker
=================

Provides a customized environment that you can run Exaile (or really any python
GStreamer/GTK3 based application) in, even if your OS does not ship with
the right dependency packages. Also provides a foundation to do testing with
packages from an OS that you don't have... just modify the included template.

Not intended for non-technical users at this time.

Requirements
------------

* Linux with docker installed
* Exaile checked out alongside this repo

Usage
-----

First, copy settings.example to settings, then to run exaile:

  ./run.sh
  
You can customize the settings file to run other programs too.

Building the image
------------------

If you wish to build your own image instead of using the image from docker
hub, then run `./build.sh` (note: if you do not add your user to the docker
group, then you will need to run build.sh via sudo). It will take a few
minutes.

Contributing
------------

Please fork and make a pull request! There's a lot of ways that this could be
improved.

Inspiration
-----------

I don't remember where I grabbed the original scripts from, but I went searching
for a pulseaudio thing and found https://github.com/terlar/docker-skype-pulseaudio,
at which point I realized it was awesome and stole most of it.

Author
======

Dustin Spicuzza (dustin@virtualroadside.com)
