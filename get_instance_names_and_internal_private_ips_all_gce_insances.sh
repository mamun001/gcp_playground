
source ./set_p.sh
echo


#gcloud --format="value(networkInterfaces[0].networkIP)" compute instances list | sort -n | uniq | sort -n
gcloud --format="value(name,networkInterfaces[0].networkIP)" compute instances list  | sort 
