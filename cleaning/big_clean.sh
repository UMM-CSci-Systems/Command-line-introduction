#!/bin/bash

# Extracts the given archive to the given scratch directory
tar -xf $1 -C $2

# Change directory, trimming off the end file extension .tgz (or any others)
# https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html#Shell-Parameter-Expansion
y=$1
cd $2/${y%.*}

# Look through files for everyone containing "DELETE ME!" and forward them to the rm command using a pipe so they can be deleted
# 1	) find . -type f will look in the current directory for file.
# 2	) -exec grep -qw "DELETE ME!" {} \; will run grep for each file with no output logs searching for word "DELETE ME!" 
# 2cont	) {} is the current file being processed, and \; will 'pass' the outcome of the previous function into the current one (So find's input is given to grep)
# 3	) -exec rm will be passed the files from the outcome of grep which are represented as {}, and rm will destroy them.
find . -type f -exec grep -qw "DELETE ME!" {} \; -exec rm {} \;

# Create the new archive back in the original folder 
tar -zcf $(cd -)/cleaned_$1 ..
