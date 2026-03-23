#!/bin/bash

ANDROID_HOME="/storage/emulated/0"

TO_SYNC_DIR=(
    "Android/media"
    "Audiobooks"
    "bluetooth"
    "DCIM"
    "Documents"
    "Downloads"
    "Movies"
    "Music"
    "Notifications"
    "PhotoGrid"
    "Pictures"
    "Podcasts"
    "rar"
    "Recordings"
    "Ringtones"
    "Share"
    )

[[ -z $TARGET_DIR ]] && printf "Computer directory not selected" && exit 0

for DIR in "${TO_SYNC_DIR[@]}"
do
    printf "Pushing $DIR"
    adbsync -v --show-progress push "$TARGET_DIR/$DIR" "$ANDROID_HOME/$DIR"
done
