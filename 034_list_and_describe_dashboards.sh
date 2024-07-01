#!/bin/bash

#  In Google Cloud Platform (GCP), a dashboard is a visual interface that provides insights and monitoring capabilities for your GCP resources and applications. Dashboards in GCP help you track the performance, health, and usage of your cloud infrastructure and services. They can display various metrics, logs, and other data points in an organized and easy-to-read format.

# Hosted Grafana?

echo
# works
#gcloud beta monitoring dashboards list --project=squad-super-heroes-dev  | grep -i displayname | sort
#gcloud beta monitoring dashboards list --project=squad-super-heroes-dev | grep -i metric | egrep -i  "ku|k8"

gcloud beta monitoring dashboards list


