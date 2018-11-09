#!/bin/bash

VERSIONNUMBER=$1        # read in of the versionnumber as commandparameter "z.B. sw 3.1.1"

DIR=$(pwd)              # save actual path in DIR

ACT_DIR=${PWD##*/}      # deletes from string PWD all character in front of "/", so the actaul directory is left behind

for SINGLE_DIR in */ ;  # loop which loops through all directories in the parentdirectory
    do
        Edit_SINGLE_DIR=${SINGLE_DIR##*-}                   # edit the directorystring with deleting all characters before the "-" character
        VERSION=${Edit_SINGLE_DIR%/*}                       # deletes all character behind the "/" including the "/" character itsself

            if [ "$VERSIONNUMBER" == "$VERSION" ]; then     # compare the red in versionnumber from the command with the versionnumber of the directory for equality
                ACT_PATH=$DIR"/"$ACT_DIR                    # if true, the actual path for the symlink is generated
                VERSIONPATH="$DIR"/"$SINGLE_DIR"            # generating the path of the directory with the searched version containing
                VERSIONPATH="${VERSIONPATH%?}"              # editing the string of the versionpath by deleting the last character "/"
                rm -f $ACT_PATH                             # deleting the the symlink-version directory if one exist already
                ln -s $VERSIONPATH $ACT_PATH                # creating a new simlink directory with the same name as the parentdirectory but a new linked version directory
                exit 0                                      # exit after successfull creation
            fi
    done
if [ "$VERSIONNUMBER" != "$VERSION" ]; then                 # if the wanted Versionnumber is unequal to all versionnumbers which the Computer contains
    echo "Keine Version auf dem PC gefunden"                # drop the message that the computer don t contain the wanted version
    exit 1                                                  # exit
fi