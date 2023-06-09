#!/bin/bash

# YOUTUBE_DL=/usr/local/bin/youtube-dl
YOUTUBE_DL=./youtube-dl
DOWNLOAD_PATH=$HOME/Downloads
FILENAME=$(date +%d%m%Y)

# Prompt for the YouTube Video ID
echo -n "Enter the YouTube Video ID: "
read VIDEO_ID

# Throw an error if the video ID is a URL
if [[ $VIDEO_ID == https://www.youtube.com/watch?v=* || $VIDEO_ID == https://youtube.com/live/* ]]; then
    echo "Error: Please enter the video ID, not the URL. For example, if the URL is https://www.youtube.com/watch?v=1234567890, enter 1234567890."
    exit 1
fi

# Download an mp4 file of the sermon (highest quality)
# python3 $YOUTUBE_DL -f bestvideo+bestaudio -o "$DOWNLOAD_PATH/$FILENAME.%(ext)s" https://www.youtube.com/watch?v=$VIDEO_ID
python3 $YOUTUBE_DL -f bestvideo+bestaudio -o "$DOWNLOAD_PATH/%(id)s.%(ext)s" https://www.youtube.com/watch?v=$VIDEO_ID
