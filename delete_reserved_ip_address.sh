


echo
echo deleting IP
sleep 3
#gcloud compute addresses delete foobar-reserved-ip --project=youtube-demo-3-367300
gcloud compute addresses delete foobar-reserved-ip  --global
echo
echo
sleep 3
echo
echo post-check
echo
gcloud compute addresses list
echo
    
