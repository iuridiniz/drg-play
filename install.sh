#!/bin/sh
#
# This software is in the public domain, furnished "as is", without technical
# support, and with no warranty, express or implied, as to its usefulness for
# any purpose.
#
# Author: Iuri Diniz <iuridiniz --at-- gmail.com>


BASEDIR=$( (cd -P "`dirname "$0"`" && pwd) )


DESTINATION="$1"
if [ "x$DESTINATION" = "x" ]; then
    DESTINATION="/usr/local"
fi

BINDIR="$DESTINATION/bin"
MANDIR="$DESTINATION/share/man/man1"

echo
echo "** Installing binaries under '$BINDIR'"
echo 

set -x

mkdir -p "$BINDIR" || exit 1

cp -f "$BASEDIR"/drgplay "$BINDIR"/drgplay || exit 1
ln -fs drgplay "$BINDIR"/drgconvert || exit 1

set +x

RST2MAN=`which rst2man`

if [ -z "$RST2MAN" -o ! -x  "$RST2MAN" ]; then
    echo 
    echo "** No rst2man, no manuals :-("
    exit 1
fi


echo
echo "** Installing man pages under '$MANDIR'"
echo

set -x

mkdir -p "$MANDIR" || exit 1
rst2man "$BASEDIR"/README.rst | \
    gzip > "$MANDIR"/drgplay.1.gz || exit 1

ln -fs drgplay.1.gz "$MANDIR"/drgconvert.1.gz || exit 1

set +x

echo



