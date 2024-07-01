
echo


# ADP
# tesla-api-lb-b001.prd.kernelfire.com → api.callfire.com
# tesla-api-lb-b002.prd.kernelfire.com → api.callfire.com

echo
source set_p.sh
echo
sleep 2


echo
echo -n "ENTER string to FILTER instance name: e.g. deleg or tesla-api-lb: or tesla-ui: "
read FILTER

echo
gcloud compute instances list --format='table(name,status,tags.list())' | grep $FILTER | cut -d\= -f4
echo
echo
