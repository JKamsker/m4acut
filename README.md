% M4ACUT(1)
% nu774 <honeycomb77@gmail.com>
% May, 2014

NAME
====

m4acut - losslessly and gaplessly cut M4A(AAC in MP4) files

SYNOPSIS
========

**m4acut** [OPTIONS] [FILE]

DESCRIPTION
===========

**m4acut** reads M4A files and extracts a portion of the audio into a new file.
When chapter mode is specified, it can automatically extract each chapter
into files, setting title tag and track tag from chapter title/number.

Since **m4acut** takes priming /padding samples into account and writes
iTunSMPB tag properly, **m4acut** allows any cut point (not restricted to
AAC frame boundaries) and the resulting files can be played gaplessly.

OPTIONS
=======
````bash
-h, --help
:   Show command help

-v, --version
:   Show version number

-o, --output <file>
:   Specify output filename. Ignored when -c/-C is set. Otherwise required.

-s, --start <[[hh:]mm:]ss[.ss..]|ns>
:   Specify cut start point in either time or number of samples.
    When not given, 0 is assumed.

    Example:
    :   588s
        :   588 samples
    :   23.46
        :   23.46 secs
    :   15
        :   15 secs
    :   39:12
        :   39m 12s


-e, --end <[[hh:]mm:]ss[.ss..]|ns>
:   Specify cut end point (exclusive). When not given, end of input is assumed.

-c, --chapter-mode
:   Enables chapter mode. Splits automatically at each chapter point.

-C, --cuesheet <file>
:   Specify cuesheet and split automatically at each track in it.

--cuesheet-encoding <name>
:   Specify character encoding name of cuesheet.
    By default, UTF-8 is assumed.

-c, -C, and -s/-e are Mutually exclusive and cannot be set at the same time.
````



RUNNING PRECOMPILED BINARIES
=================

Either use the docker image (recommended) or use this commands (Tested on ubuntu):

```bash
# prerequisits
apt update && apt install -y wget unzip

# downloading releases of m4acut && the required shared libraries
wget https://github.com/JKamsker/l-smash/releases/download/v2.14.7-beta-02/Artifacts.zip \
&& unzip Artifacts.zip \
&& rm Artifacts.zip

wget https://github.com/JKamsker/m4acut/releases/download/v0.1.3-alpha-02/Artifacts.zip \
&& unzip Artifacts.zip \
&& rm Artifacts.zip

# Setting environment variables & chmod
chmod +x m4acut \
&& LD_LIBRARY_PATH=$PWD/lib \
&& export LD_LIBRARY_PATH \

# running the binary
./m4acut
```
