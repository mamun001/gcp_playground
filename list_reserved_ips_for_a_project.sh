
source ./set_p.sh
echo

#gcloud compute addresses list | grep IN_USE | awk '{print $2}' | sort -n > ./tmp.ips
gcloud compute addresses list | awk '{print $2}' | sort -n > ./tmp.ips
echo
cat ./tmp.ips
echo
sleep 3


exit 0


