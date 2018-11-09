#!/bin/bash

VERSIONNUMBER=$1

DIR=$(pwd)

ACT_DIR=${PWD##*/}

for SINGLE_DIR in */ ;
    do
        Edit_SINGLE_DIR=${SINGLE_DIR##*-} 
        VERSION=${Edit_SINGLE_DIR%/*}  

            if [ "$VERSIONNUMBER" == "$VERSION" ]; then
                ACT_PATH=$DIR"/"$ACT_DIR
                VERSIONPATH="$DIR"/"$SINGLE_DIR"
                VERSIONPATH="${VERSIONPATH%?}"
                rm -f $ACT_PATH
                ln -s $VERSIONPATH $ACT_PATH
                exit 0
            fi
    done
if [ "$VERSIONNUMBER" != "$VERSION" ]; then
    echo "Keine Version auf dem PC gefunden"
    exit 1
fi