#!/bin/bash

echo 
echo ENTER KEYWORD TO SEARCH
read KW


echo ______________________________________________________________________________________________________
echo
echo projects list:
echo
gcloud projects list | sort  | grep $KW 
echo




