

source ./set_p.sh
echo

echo
echo LIST:
echo
gcloud compute forwarding-rules list --global | sort
echo

echo
echo -n "ENTER RULE: "
read RULE
echo RULE=$RULE
echo

echo
echo describe:
echo
#gcloud compute forwarding-rules describe k8s-fws-foo-ingressfanout-foo-com--79b08f4b77e04c62 --global
gcloud compute forwarding-rules describe $RULE --global
