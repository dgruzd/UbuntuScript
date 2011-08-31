#!/bin/sh
curl -s albatross.ripe.net/delegated-extended/delegated-ripencc-extended-latest.bz2 | bunzip2 | awk -F'|' '/available/&&/ipv4/ {sum+=$5} END {print sum}'
