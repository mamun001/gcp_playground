
source ./set_p.sh
echo

# intrenal
#gcloud --format="value(networkInterfaces[0].networkIP)" compute instances list | sort -n | uniq | sort -n


# external , works but ONLY IPs
#gcloud --format="value(networkInterfaces[0].accessConfigs[0].natIP)" compute instances list | sort -n | uniq | sort -n

gcloud --format="value(name,networkInterfaces[0].accessConfigs[0].natIP)" compute instances list | sort -n | uniq | sort -n


#gcloud --format="value(name,networkInterfaces[0].networkIP)" compute instances list 
