#!/bin/bash


# 3 ways of finding the same count:
echo Number of Alerts Policies:
# This has been confirmed by looking at the console
gcloud alpha monitoring policies list | grep -i alertpolicies | grep -vi condition | wc -l



# works, but not any more useful
#gcloud alpha monitoring policies list --format="json" > ./tmp.alertpolicies.json

