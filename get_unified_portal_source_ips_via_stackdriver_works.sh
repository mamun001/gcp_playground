
#   timestamp="2021-02-09T00:46:33.926627306Z"

# from nicolai works

#gcloud logging read --project foo-concert  "resource.type=k8s_container AND labels.k8s-pod/app=msuniteddms" --format=json | jq -cn --stream "fromstream(1|truncate_stream(inputs))" | jq '[.timestamp,.severity,.resource.labels.pod_name,.jsonPayload.message] | join(",")'


COUNT=10000
echo starting to get logs COUNT=$COUNT
echo
#worked
date
gcloud logging read --project foo-concert  "resource.type=http_load_balancer AND resource.labels.forwarding_rule_name=k8s-fws-production-ingressfanout-foo-com--8c6bd48dc58d3ca0 AND resource.labels.url_map_name=k8s-um-production-ingressfanout-foo-com--8c6bd48dc58d3ca0" --format=json  --limit=$COUNT | grep -i remote > j1
date



#worked
#gcloud logging read --project foo-concert  resource.type=http_load_balancer resource.labels.forwarding_rule_name=k8s-fws-production-ingressfanout-foo-com--8c6bd48dc58d3ca0 resource.labels.url_map_name=k8s-um-production-ingressfanout-foo-com--8c6bd48dc58d3ca0 --limit=$COUNT 

#worked
#gcloud logging read --project foo-concert  'timestamp<="2021-02-08T00:05:59Z" AND timestamp>="2021-02-07T23:55:00Z"'

# worked
#gcloud logging read --project foo-concert  'resource.type=http_load_balancer AND timestamp<="2021-02-08T00:05:59Z" AND timestamp>="2021-02-07T23:55:00Z" AND resource.labels.forwarding_rule_name=k8s-fws-production-ingressfanout-foo-com--8c6bd48dc58d3ca0 AND resource.labels.url_map_name=k8s-um-production-ingressfanout-foo-com--8c6bd48dc58d3ca0'


echo
echo done


echo 
echo getting only IPs
echo
cut -d: -f2 j1 | cut -c3-99 | cut -d\" -f1 > j2
echo
echo done

echo sort
sort -n j2 > j3
echo done


echo creating ben file
uniq -c j3 | awk '{print $1": "$2}' | sort -nr | head  > ben8
echo done

cat ben8
