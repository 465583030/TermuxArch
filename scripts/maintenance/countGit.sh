#!/bin/sh -e 
# Copyright 2018 (c) all rights reserved 
# by S D Rausty https://sdrausty.github.io
#####################################################################
gsn.sh >> CHANGE.log
du -hs .git >> CHANGE.log
du -hs >> CHANGE.log
#git push master --force 
