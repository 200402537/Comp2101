#!/bin/bash
#
# this script puts some picture files into a Pictures directory in our home directory
# it only runs commands if they need to be run and only shows necessary output
# it summarizes the Pictures directory when it is done
#

# Improve this script to also retrieve and install the files kept in the https://zonzorp.net/pics.tgz tarfile
#   - use the same kind of testing to make sure commands work and delete the local copy of the tarfile when you are done with it

# make a Pictures directory if we don't have one - assumes we have a home directory
test -d ~/Pictures || mkdir ~/Pictures

# download a zipfile of pictures to our Pictures directory if it isn't already there - assumes you are online
test -f ~/Pictures/pics.zip || wget -q -O ~/Pictures/pics.zip http://zonzorp.net/pics.zip

# unpack the downloaded zipfile if it is there, then delete the local copy of the zipfile
test -f ~/Pictures/pics.zip && unzip -d ~/Pictures -o -q ~/Pictures/pics.zip && rm ~/Pictures/pics.zip

#modify the script to also get the .tgz file
#download the .tgz file to the pictures directory if it isn't already there
test -f ~/Pictures/pics.tgz || wget -q -O ~/Pictures/pics.tgz http://zonzorp.net/pics.tgz

#unpack the downloaded tgz file to Pictures directory and if it is there delete a local copy of zip file
test -f ~/Pictures/pics.tgz && tar -xzf ~/Pictures/pics.tgz -C ~/Pictures && rm ~/Pictures/pics.tgz

# Make a report on what we have in the Pictures directory
test -d ~/Pictures && cat <<EOF
Found $(find ~/Pictures -type f|wc -l) files in the Pictures directory.
The Pictures directory uses $(du -sh ~/Pictures|awk '{print $1}') space on the disk.
EOF
#test