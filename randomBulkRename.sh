#!/bin/bash

# Grabs current directory
directory=$1
echo $directory

# Randomly renames provided file
function randomRename ()
{
    file=$1
    random=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`
    echo $file
    mv "$file" "$directory/$random"
}

# Randomly renames all files in directory
for file in $directory/*
do
    randomRename "$file"
done

