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

Alternatively, if you wish to use a Wayland-based display instead of X11, you
can do this instead:

    ./run_wayland.sh

Building the image
------------------

If you wish to build your own image instead of using the image from docker
hub, then run `./build.sh` (note: if you do not add your user to the docker
group, then you will need to run build.sh via sudo). It will take a few
minutes.

Submitting a new tag
--------------------

If you have access to the 
[docker hub](https://cloud.docker.com/u/exaile/repository/docker/exaile/gst-python/general),
you can push a new tag to docker.
This step is required before you can use a docker tag, e.g. in
exaile/exaile-testimg. After running `./build.sh` as described above, you will
need to `docker push exaile/gst-python`, which will upload the containers
to docker.com. If you get a `requested access to the resource is denied` error,
you may need to `docker login` before that.

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
