#!/bin/bash

# DYNV6_ZONES from environmental variables added to myarray
myarray=(`echo $DYNV6_ZONES | tr ',' ' '`)

# Iterate over myarray and call update process for each element
for (( i=0; i<=${#myarray[@]}-1; i++ )); do
    token=$DYNV6_TOKEN /code/dynv6.sh "${myarray[$i]}"
done
