#!/bin/sh

set -ex

for file in `ls ./provision/*.rb`; do
  echo $file
  ruby $file
  echo
done
