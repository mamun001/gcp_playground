#!/bin/bash
echo
echo
echo -n "ENTER string to FILTER instance name: e.g. deleg or tesla-api-lb: or tesla-ui: "
read FILTER

echo
gcloud compute instances list --format='table(name,status,tags.list())' | grep $FILTER | cut -d\= -f4
echo
echo
