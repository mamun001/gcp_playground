
exit 0

from manasa:

gcloud compute firewall-rules create k8s-fw-l7--a8ef29a66e0db416 --network shared-net --description "GCE L7 firewall rule" --allow tcp:30000-32767 --source-ranges 130.211.0.0/22,209.85.152.0/22,209.85.204.0/22,35.191.0.0/16 --target-tags gke-foo-cluster-024f1c89-node --project foo-prod-shared
