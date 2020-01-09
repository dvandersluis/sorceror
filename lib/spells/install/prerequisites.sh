#!/bin/bash

. lib/share/ui.sh

announce 'Determining Prequisites'

if [[ "$OSTYPE" != "darwin"* ]]; then
  abort 'Cannot proceed with setup: MacOSX required.'
fi

prerequisites=( ruby curl )

for cmd in "${prerequisites[@]}"; do
  printf "$cmd... "
  result $(which $cmd) || err=1
done

if [ $err ]; then
  abort 'Cannot proceed with setup: Please ensure all prerequisites are installed.'
fi
