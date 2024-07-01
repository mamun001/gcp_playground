

echo ________________________________________________________________________
echo
echo
echo URL-MAP IS LOAD BALANCER in GCP 
echo URL-MAP IS LOAD BALANCER in GCP 
echo URL-MAP IS LOAD BALANCER in GCP 
echo URL-MAP IS LOAD BALANCER in GCP 
echo
echo
sleep 7


echo ________________________________________________________________________
echo
echo 
echo you can have HTTP or HTTPS
echo
echo Either way you need a BACKEND SERVICE
echo to make a Backend Service you need a HEALTHCHECK
echo
sleep 7

echo ________________________________________________________________________
echo
echo setting account to PERSONAL
echo
sleep 2
gcloud config set account johndoe@gmail.com
echo
sleep 3

echo ________________________________________________________________________
echo






echo _______________________________________________
echo
echo creating a healthcheck
echo
gcloud compute health-checks create http foobar-http-basic-check \
      --port 80 \
      --project=youtube-demo-3-367300
echo
echo 
sleep 5
echo post check
gcloud compute health-checks list
echo
echo
sleep 7


echo _________________________________________________________
echo
echo Create Backend Service
echo
gcloud compute backend-services create foobar-web-backend-service \
      --load-balancing-scheme=EXTERNAL \
      --protocol=HTTP \
      --port-name=http \
      --health-checks=foobar-http-basic-check \
      --global \
      --project=youtube-demo-3-367300
echo 
echo post-heck
echo
gcloud compute backend-services list
echo
sleep 7



echo __________________________________________________________________________
echo
echo For HTTP, create a URL map to route the incoming requests to the default backend service
echo
echo
gcloud compute url-maps create foobar-web-map-http \
      --default-service foobar-web-backend-service
echo
echo
echo post-check
echo
gcloud compute url-maps list
echo
echo
sleep 7

  

echo __________________________________________________________________________
echo
echo For HTTPS, create a URL map to route the incoming requests to the default backend service
echo
gcloud compute url-maps create foobar-web-map-https \
      --default-service foobar-web-backend-service
echo
echo
echo post-check
echo
gcloud compute url-maps list
echo
echo
sleep 7


echo __________________________________________________________________________
echo
echo Starting CLEAN UP in 15 seconds in reverse order
sleep 15
echo
echo

echo ______
gcloud compute url-maps delete foobar-web-map-https  --project=youtube-demo-3-367300 -q
gcloud compute url-maps delete foobar-web-map-http --project=youtube-demo-3-367300 -q
echo
sleep 7

echo _____
echo backend-service
gcloud compute backend-services delete   foobar-web-backend-service --project=youtube-demo-3-367300 --global -q
sleep 7

echo _____
echo health-check
gcloud compute health-checks delete foobar-http-basic-check --project=youtube-demo-3-367300  -q
sleep 7

