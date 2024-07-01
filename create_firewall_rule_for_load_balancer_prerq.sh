

echo works
echo personal account
echo youtubedemo project 3 hard coded
echo
sleep 5

echo starting
echo
sleep 3
gcloud compute firewall-rules create foobar-firewall-rule-allow-healthcheck \
    --network=default \
    --action=allow \
    --direction=ingress \
    --source-ranges=130.211.0.0/22,35.191.0.0/16 \
    --rules=tcp:80 \
    --project=youtube-demo-3-367300


exit 0
    --target-tags=allow-health-check \
