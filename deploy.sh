#!/bin/bash

HOST=
USERNAME=
PASSWORD=
TARGETDIR=/
LOCALDIR=.
EXCLUDE=$(sed 's/^/--exclude /' .deployignore | tr '\n' ' ')

lftp -e "
open $HOST
user $USERNAME $PASSWORD
cd $TARGETDIR
lcd $LOCALDIR
mirror $EXCLUDE -L --reverse --delete --verbose $LOCALDIR $TARGETDIR
bye
"

