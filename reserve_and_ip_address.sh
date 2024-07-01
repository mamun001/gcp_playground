
gcloud compute addresses create foobar-reserved-ip \
    --ip-version=IPV4 \
    --network-tier=PREMIUM \
    --global \
    --project=youtube-demo-3-367300

echo
echo
sleep 3
echo
echo post-check
echo
gcloud compute addresses list
echo
    
