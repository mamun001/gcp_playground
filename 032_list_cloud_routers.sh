#!/bin/bash

#  In Google Cloud Platform (GCP), a Cloud Router is a managed service that dynamically exchanges routes between your Virtual Private Cloud (VPC) network and on-premises networks using the Border Gateway Protocol (BGP). Cloud Router is essential for enabling dynamic routing in GCP, allowing for more efficient and scalable network management


echo
gcloud compute routers list  |  grep us
echo
