#!/bin/bash

CERTS_VARS="/.certs_vars"

source $CERTS_VARS

for i in suma2 suma3 suma4; do rhn-ssl-tool --gen-server --dir="$DIR" --set-country="$COUNTRY" \
--set-state="$STATE" --set-city="$CITY" --set-org="$ORG" \
--set-org-unit="$ORG_UNIT" --set-email="$EMAIL" \
--set-hostname=$i.stein.lab --set-cname="$CNAME"; done



for i in suma2 suma3 suma4; do rsync -avz --progress /var/lib/containers/storage/volumes/root/_data/ssl-build/$i root@$i:~;done
for i in suma2 suma3 suma4; do rsync -avz --progress /var/lib/containers/storage/volumes/root/_data/ssl-build/RHN-ORG-TRUSTED-SSL-CERT root@$i:~/$i/;done
