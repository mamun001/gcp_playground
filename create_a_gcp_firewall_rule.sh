

source ./set_p.sh
echo
sleep 5


#gcloud compute firewall-rules create ssh-to-gateway --allow tcp:22 --source-ranges=75.51.241.183/32 --destination-ranges=34.69.206.70/32

gcloud compute firewall-rules create mrashid-ip-ssh-to-default-network --allow tcp:22 --source-ranges=75.51.241.183/32  --network default
