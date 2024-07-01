


source set_p.sh
echo

# To create a static IP in EU from ingress
#gcloud compute addresses create eu-ingressfanout-foo-com --addresses 35.244.210.214 --global
#  TO UNDO
#gcloud compute addresses delete eu-ingressfanout-foo-com --global


exit 0

# devperm ingress , not reserved yet
#foo     ingressfanout            manage-devperm.arcusaas.com                                    34.107.159.108   80, 443 
# worked
#gcloud compute addresses create ingress-fanout-devperm --addresses 34.107.159.108 --global
#gcloud compute addresses delete ingress-fanout-devperm 


# worked (preview)
gcloud compute addresses create k8s-fws-preview-msreversehttp --addresses 34.107.221.249 --global
#gcloud compute addresses delete k8s-fws-preview-msreversehttp --global
