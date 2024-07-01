

# All alerts are in the superheor project?
#
gcloud config set project squad-super-heroes-dev
echo
echo
sleep 5

# 3 ways of finding the same count:
echo Number of Alerts Policies:
# This has been confirmed by looking at the console
gcloud alpha monitoring policies list | grep -i alertpolicies | grep -vi condition | wc -l
# works, but not any more useful
#gcloud alpha monitoring policies list --format="json" > ./tmp.alertpolicies.json
gcloud alpha monitoring policies list | grep -i combiner | wc -l
gcloud alpha monitoring policies list | grep ^displayName | wc -l
echo
# average line of definition has 39 lines: 4210/107


#
echo
gcloud alpha monitoring policies list | grep -n container.googleapis.com

