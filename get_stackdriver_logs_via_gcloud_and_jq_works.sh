
# from nicolai works

gcloud logging read --project foo-concert  "resource.type=k8s_container AND labels.k8s-pod/app=msuniteddms" --format=json | jq -cn --stream "fromstream(1|truncate_stream(inputs))" | jq '[.timestamp,.severity,.resource.labels.pod_name,.jsonPayload.message] | join(",")'
