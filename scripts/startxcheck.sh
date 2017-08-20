#!/bin/bash

echo "Start X Server? [Yn]"

while true; do
	read -s -n 1 yn

	if [ -z "$yn" ] || [[ $yn == "y"  ]] || [[ $yn == "Y" ]]; then
		exit 0;
	elif [[ $yn == "n" ]] || [[ $yn == "N"  ]]; then
		exit 1;
	fi
done
