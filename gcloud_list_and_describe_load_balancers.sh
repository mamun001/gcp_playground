
source ./set_p.sh

gcloud compute url-maps list
echo
echo
sleep 4

#  DESCRIBE
# works if in the right project
#
echo -n "Which Load-Balancer: "
read LB
gcloud compute url-maps describe $LB
echo

