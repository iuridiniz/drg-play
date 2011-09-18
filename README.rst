=======
drgplay 
=======

---------------
Plays DRG files 
---------------

:Author: Iuri Diniz - iuridiniz --at-- gmail.com
:Homepage: http://blog.igdium.com
:Date:   2011-09-18
:Copyright: Public Domain
:License: Public Domain
:Version: 0.1
:Manual section: 1
:Manual group: shell scripts

Synopsis
--------

**drgplay** *inputfile*

Description
-----------
A shell script that takes a .drg file from I-Doser and play it to 
default sound output.

The authors of this project have nothing to do with I-Doser, 
I-Doser is a registered trademark.

This project does not supports piracy or any illegal action, 
the use of this product must be stricly to play .drg files on plattaforms 
(notably Linux) that don't have I-Doser to play the drg file.

I-Doser and I-Doser files (.drg) may be acquired at:

* http://www.i-doser.com/

Overview of pipeline
====================

This shell script is a processing chain that can be summarised as follows:

    DRG input file → convert DRG into SBA → Convert SBA into RAW audio → 
    system sound output 

Options
-------

No options for while.


Instalation
-----------

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
  
  It can play raw files.

  Available under most major Linux distributions.

In order to install man page, you will need:

* rst2man
  
  Avaiable on python-docutils

In order to checkout the code using shell, you will need:

* git
  
  Available under most major Linux distributions.



How to install drg2sbg under Ubuntu 11.04
=========================================
Install the build requiments in order to compile drg2sbg::

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

Install it (under /usr/local/bin)::

  $ sudo cp drgplay /usr/local/bin

If you want, install the man page (under /usr/local/share/man), 
*it's necessary pyhton-docutils*::
  
  $ sudo mkdir -p /usr/local/share/man/man1
  $ rst2man README.rst > drgplay.1 
  $ gzip drgplay.1
  $ sudo cp drgplay.1.gz /usr/local/share/man/man1

