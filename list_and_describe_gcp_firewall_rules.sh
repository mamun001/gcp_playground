
source ./set_p.sh
echo
echo


echo _______________________________________________________________
echo
echo COUNT
echo
#gcloud compute firewall-rules list  | wc -l 
gcloud compute firewall-rules list --format="table( name, sourceRanges.list():label=SRC_RANGES, allowed[].map().firewall_rule().list():label=ALLOW, disabled)" | wc -l
echo
echo
sleep 5

echo _______________________________________________________________
#gcloud compute firewall-rules list  | more
echo
echo
echo
#gcloud compute firewall-rules list --format="table(
        #name,
        #network,
        #direction,
        #priority,
        #sourceRanges.list():label=SRC_RANGES,
        #destinationRanges.list():label=DEST_RANGES,
        #allowed[].map().firewall_rule().list():label=ALLOW,
        #denied[].map().firewall_rule().list():label=DENY,
        #sourceTags.list():label=SRC_TAGS,
        #sourceServiceAccounts.list():label=SRC_SVC_ACCT,
        #targetTags.list():label=TARGET_TAGS,
        #targetServiceAccounts.list():label=TARGET_SVC_ACCT,
        #disabled
    #)" | head


gcloud compute firewall-rules list --format="table( name, sourceRanges.list():label=SRC_RANGES, allowed[].map().firewall_rule().list():label=ALLOW, disabled)" | grep -i false | cut -c1-120
echo
echo
echo



#____________________________________________________________________
exit 0
gcloud compute firewall-rules list  | grep tcp:22
echo
echo
sleep 3

exit 0

# The following also works
echo
echo
gcloud compute firewall-rules list --format json
echo
