---
title: "Raspberry Pi"
categories:
- Study
published: true
feature_image: /assets/fig/raspberry-pi/pi.jpg
#feature_text: |
#  Enjoy the fully-functional linux toy
excerpt: |
  A home server it is.
---

Recently I got myself a raspberry Pi as a 'quarantine gift'. It is my first experience with chips or boards. It is a small kid with all the functions of a linux machine. I do encounter some difficulties like its poor audio output with 3.5 mm Jack and have to figure out something else to get around it. But over all, I enjoy exploring all of its functions.

What I have built on it include a website server, syncronized cloud storage, NAS, media center, server monitor, etc. For the website, I use the homepage to list all those entertainments and some tools I used.

{% include figure.html image="/assets/fig/raspberry-pi/web.jpeg" caption="home page of the website hosted on it" %}

## Media Center
### jellyfin
jellyfin is a media server. I used it to manage libaries for musics, movies and MVs, and stream to the home network.
### [plex](https://linuxize.com/post/how-to-install-plex-media-server-on-raspberry-pi/)
plex is something similar to jellyfin. I don't know which one is better so just let both running.
### kodi
kodi is a media player. Both jellyfin and plex has their own web interface for online streaming. The streaming works in two ways, either transcoding in the server or on the player. Becuase raspberry is actually very weak on transcoding video, the latter just don't work. Since some video format has to be transcoded before playing, I need to ensure the transcoding happens on the player side. Here Kodi fulfill the needs. Kodi is a home theatre player, with plugins to connect to jellyfin and plex seamlessly. In this way, the playing add little over head to the raspberry Pi and is very smooth.


{% include figure.html image="/assets/fig/raspberry-pi/jellyfin.jpeg" caption="jellyfin" %}

{% include figure.html image="/assets/fig/raspberry-pi/kodi.png" caption="kodi" %}

{% include figure.html image="/assets/fig/raspberry-pi/bt.jpeg" caption="bt.jpeg" %}

## NAS storage - samba
samba uses the `smb` protocal to share files. All machines in Windows, Mac and Linux can connect to it. For now I just [add an old 500G hard drive](https://blog.alexellis.io/attach-usb-storage/) for it. It is mainly for media files.

## Bit Torrent - Transmission
It is a bit illegal but I am still using bit torrent service for high quality movies. The service comes from my undergraduate school, which is one among the few still avaliable in China. Many of its user are all over the world, so the speed is quite good in US as well.

A 24/7 bt client would be very helpful for upload/doanload ratio. I haven't set up port forwarding yet, cause I don't have access to the route yet. Not sure if the uploading is working. Lets see...

## syncronized storage - NextCloud
samba provide huge storage on the server. But in order to synchronize your folders in many machine and let you work offline sometimes, one need service like dropbox or google drive. Google drive has huge space but some times is slow in real-time sync. Dropbox only give 2G space for free. NextCloud solve all these for you. It is real-time and one can use upto all the space you have in the server.

It is quite annoying to set up next cloud on your own. Luckily they have provided a docker image. That took one minute to set up.

## Monitoring tools
### bt
bt is very powerful on monitoring a server. It also let you install many sevices by one click. I used it to
- monitor server usage ( cpu, internet, storage ...)
- install LAMP for web hosting
- monitor ports. It works like a firewall and one need to manually allow ports. This is annoying but it is a good way to keep a record of those ports I am using.

### [VNC](https://help.realvnc.com/hc/en-us/articles/360002249917-VNC-Connect-and-Raspberry-Pi#setting-up-your-raspberry-pi-0-0)
The virtual desktop can be viewer from any other machine, including my 7 years old android phone.

### html webpage for download and logfile
 I setup an html page for logfile. It prints a particular log file on the web and refreshes every 2 seconds. That is a quick way to monitoring a job without log into the machine.

I also set up another page for downloading files. Some times I need to find some apk for android apps. It is easier to download in my mac and get it from the web on my phones. Sounds more complicated, but it is simple when the flow has been set automatically. In such way I get rid of those Ads in those apk downloading website.


## Tips - Other thing I learned along the way

### zsh and oh-my-zsh
those are just a cool replacement for bash

### use softlink to manage configuration files.
Github is quite useful for my projects, and help me to maintain only one version in multiple machines. But how about the configuration files? Can you synchronized them? How?

I wasn't able to do it, cause I don't know where to put the git repo? Most configuration file are in the home directory with a `.` prefix. It is definitely too big to put a repo in my home direcory....and dot files are hidden and are ignored by git...

Any way, now I figured out how to do it. I just create a repo in my normal directory like `~/Documents/GitHub/some-config/`. I remove the prefix, so `.bash_aliases` would be named as `bash_aliases`. Then I create a soft link `~/.bash_aliases`, which points to the file in the repo and replace the original file with same name. In such way, I can easily maintain those configuration file over multiple machines. And the files are not hidden by default.



### Links for the gut
to be updated





