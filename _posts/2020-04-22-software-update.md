---
title: "Software Update"
categories:
- Study
published: true
use-math: true
feature_image: "/assets/fig/dockerhub.png"
# original link of image: "https://zdnet2.cbsistatic.com/hub/i/r/2019/04/27/d7311871-381a-4928-a1d9-04c69c6ea4de/resize/1200x900/99ef8a9fdb15356e4de4dcfe12803fa3/dockerhub.png"
---

I got sometime to dig into some softwares, which has improved my productivity a lot. Those include
  Docker, jekyll-scholar, mathjax, github

<!-- more -->

## Docker

__use any system or software within one line__

In order to endorse [Docker](https://www.docker.com/), I will start with the following general discussion. How do you get a linux environment on Windows laptop/PC?

- Connect to a linux server
- Install a linux system on another disk other than `C:\`, so called _double system_.
- Install a linux virtual box/machine
- use Windows Subsystem for Linux (WSL)
- use Cygwin
- use MinGW
- use Docker
- ...

If you have a linux server, that is very nice and that is what we usually do for computing on research. Here I discuss the cases where we want to use some application or bash on linux or just want a linux system to play with.

Since college, I saw many people install double system to use linux. This works just fine and you have a whole linux system. The inconvenience comes when you want to use a Windows app, you have to reboot your system. The virtual box is an improvement of this option, where you get a whole linux system with GUI, within Windows. This makes it easier to access apps on both Windows and Linux, and now most laptops have the hardware capability to do so.

{% include figure.html image="/assets/fig/wsl-cygwin-mingw.png" %}

MinGW, Cygwin and WSL are similar options. MinGW only provides a minimal set of linux tools like bash. Cygwin is more powerful and emulates many of the small details of Linux. WSL is a recent feature provided by Microsoft itself. It is a real Linux kernel built on a lightweight VM. Unlike VM, it doesn't run some daemon tasks itself, but can connect to the deamon runing on windows. For example, if one wants to use Docker on WSL, one need to install Docker Desktop on windows, and then call docker deamon in WSL. WSL is powerful but still in development. One may encounter all kinds of problems when using it just like a linux system. For me, it is just a convenient way to run linux command on Windows. For more detail, see [Compare the difference between Cygwin, MinGW and WSL](https://ericzhng.github.io/eric-blogs/2019/07/25/comparison-cygwin-mingw-wsl/)

Finally, I am going to endorse Docker. Docker using this idea of container, which works as a software, but has all the function of a virtual machine. It uses `Dockerfile` to define a container. That is similar to `MakeFile`, where you define a sequence of commands and give it a name, then just call that name to run all the commands in one line. The difference in Dockerfile is that it start from an operating system (OS), and then run commands in that OS. That OS could be any version of linux or windows. It takes one line to build an image from this Dockerfile. Image is another major feature of docker, which is an OS with all the commands in the Dockerfile already been runned. Those commands are the same as the usual commands in the system, which are mostly used to install softwares and process data files. One only need to build this image once, and next time, one can start from those images immediately.

In short, docker provide a way to run any virtual environment within one line. It has a community support of all kinds of environment on DockerHub, which help you to define your own environment very easily. I personally use it to define [a working environment on ubuntu](https://hub.docker.com/repository/docker/weileizeng/itpp-full), which has installed all the packages I use in my research. This way others can run my code very easily, instead of setting up the environment first. The latter, usually prevents anyone else to run my code in practice. In the meantime, just for entertainment, I use it to deploy a home media center ([plex](https://www.plex.tv/)) and cloud file system ([nextcloud](https://nextcloud.com/))

## GitHub

[Git](https://git-scm.com/) is a version control software and [GitHub](https://github.com/) is an online host of Git. With Git, one never worry about forgetting things or breaking your code. Now I use it everyday, for codes as well as any other writing projects. Some people even use GitHub for collaboratin on writing a paper. That works well too, though ShareLatex might be a better option.

## jekyll-scholar & mathjax

How do you write scientific stuff on your blog? One option is not to do it, as many people donot want to read equations in a blog. But if you insist to, [jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) and [mathjax](https://www.mathjax.org/) make everything easy, as if you are writing in latex. These two tools meet all the needs to write in markdown. If you have some previous writing in latex and now want to post it in a blog. Other than give a link to the pdf, one can use `pandoc` to convert the `.tex` file into `.md` file first. Probably fix one or two bugs then it should be okay.







