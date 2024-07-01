#!/bin/bash
echo
gcloud --format="value(networkInterfaces[0].networkIP)" compute instances list | sort -n | uniq | sort -n
