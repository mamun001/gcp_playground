#!/bin/bash
echo
echo it will open the browser. login with saas account.
echo
sleep 2
echo _______________________________________
echo
sleep 1
gcloud auth login
echo
echo

echo __________________
echo
echo setting project to cf-production
echo
sleep 5
gcloud config set project cf-production
echo
echo
sleep 5

echo ________________________________________
echo
echo post-check
echo buckets list
echo you should see over 100 buckets
echo
sleep 5
gcloud storage buckets list | grep id: | sort | uniq | wc -l
echo
echo
