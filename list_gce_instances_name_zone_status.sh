
source ./set_p.sh
echo

gcloud compute instances list --format="table[box,title=Instances](name:sort=1, zone:label=zone, status)"
exit 0
gcloud --format="value(networkInterfaces[0].networkIP)" compute instances list | sort -n | uniq | sort -n
