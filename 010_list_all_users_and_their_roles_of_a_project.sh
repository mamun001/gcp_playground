#!/bin/bash


source ./set_project.sh


echo
echo
gcloud projects get-iam-policy $PROJECT
echo
echo
