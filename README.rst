=======
drgplay 
=======

---------------------
DRG Support for linux
---------------------

:Author: Iuri Diniz - iuridiniz --at-- gmail.com
:Homepage: http://blog.igdium.com
:Date:   2011-09-18
:Copyright: Public Domain
:License: Public Domain
:Version: 0.3
:Manual section: 1
:Manual group: audio

Synopsis
--------

**drgplay** *inputfile*

**drgconvert** *inputfile* *outputfile*

Description
-----------
A serie of programs that take a .drg file from I-Doser and play it to 
default sound output or convert to another format.

It can convert a drg file to every output format file supported by SoX. 
Actually, sox is used to convert.

The authors of this project have nothing to do with I-Doser, 
I-Doser is a registered trademark.

This project does not supports piracy or any illegal action, 
the use of this product must be strictly to play .drg files on platforms 
(notably Linux) that don't have I-Doser to play the drg file.

I-Doser and I-Doser files (.drg) may be acquired at:

* http://www.i-doser.com/

Overview of pipeline
====================

This program is a processing chain that can be summarized as follows:

    DRG input file → convert DRG into SBG → Convert SBG into RAW audio → 
    system sound output 

Usage Examples
==============

Example to listen a drg file::
  
  $ drgplay inputfile.drg

Example to convert to ogg::
    
  $ drgconvert inputfile.drg outputfile.ogg

Example to convert drg file to mp3 (only if SoX has support)::

  $ drgconvert inputfile.drg outputfile.mp3

If SoX doesn't have support to mp3, you can do two things

1. Recompile SoX with libmad or liblame.

2. Use another program to convert.
   
   In this case, it's necessary to pass sampĺe frequency of 44100Hz 
   and sample bit rate width of 16. 

   Lame can be used to do this::
      
      $ drgconvert inputfile.drg - | lame -r -s 44.1 --bitwidth 16 - output.mp3

Options
-------
No options for while.

Installation
------------

Requirements
============
In order to run, you will need:

* A posix machine 

  Maybe Linux or MacOS.

* A shell 
  
  Bourne Againt Shell (bash) is a valid choice.

  Most major Linux distributions have a shell.

* drg2sbg
  
  It transforms .drg file into .sbg file.
  
  You can get it from http://code.google.com/p/drg2sbg/.

* sbagen 

  It transform .sbg file into .raw file.
  
  You can get it from: http://uazu.net/sbagen/.

* SoX 
  
  It can play and convert raw files to various formats.

  Available under most major Linux distributions.

In order to install man page, you will need:

* rst2man
  
  Available on python-docutils

In order to checkout the code using shell, you will need:

* git
  
  Available under most major Linux distributions.

How to install drg2sbg under Ubuntu 11.04
=========================================
Install the build requirements in order to compile drg2sbg::

  $ sudo apt-get install build-essential libssl-dev

Download and unpack drg2sbg (in this example version 1.2.11 will be used)::

  $ wget http://drg2sbg.googlecode.com/files/drg2sbg-1.2.11.tar.gz
  $ tar xvzf drg2sbg-1.2.11.tar.gz
  $ cd drg2sbg-1.2.11/

Configure and compile it:: 

  $ ./configure && make

Install it (under /usr/local/bin)::

  $ sudo make install

How to install SBaGen under Ubuntu 11.04
========================================

Install the build requiments in order to compile sbagen 
(already installed if you had installed drg2gen):: 

  $ sudo apt-get install build-essential

Download and unpack sbagen (in this example version 1.4.5 will be used)::

  $ wget http://uazu.net/sbagen/sbagen-1.4.5.tgz
  $ tar xvzf sbagen-1.4.5.tgz 
  $ cd sbagen-1.4.5/

Compile it::

  $ gcc -DT_POSIX -Wall -O3 -s -lm -lpthread sbagen.c -o sbagen

Install it (under /usr/local/bin)::

  $ sudo cp sbagen /usr/local/bin

How to install SOX under Ubuntu 11.04
=====================================

SOX is available under ubuntu repositories, just use apt-get::

  $ sudo apt-get install sox

(optional) How to install python-docutils under Ubuntu 11.04
============================================================

python-docutils is available under ubuntu repositories, just use apt-get::

  $ sudo apt-get install python-docutils

Installing drgplay
==================
.. TODO: make an install script

Checkout last revision of drgplay::
  
  $ git clone http://github.com/iuridiniz/drg-play.git
  $ cd drg-play

Install it (under /usr/local)::

  $ sudo ./install.sh /usr/local

Links
-----
Open Doser
  Another project for the same purpose: http://code.google.com/p/opendoser/

Free Doser
  Another project for the same purpose: http://www.khattam.info/tag/freedoser/

TODO
----

Plan for 1.0:

* Transform SBaGen and drg2sbg into a lib (each one) (must be GPL libs)

* Provide gstreamer plugins using these libs (must be GPL too)

  * gstreamer compatible players and converters may use drg files

* DRGplayer using GTK+ and C (must be GPL)
