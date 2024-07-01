
#gcloud alpha projects create command.


exit 0
# fails on permission
gcloud projects create sandbox-mamun
# works using factory json file as gcloud auth
gcloud projects create sandbox-mamun --folder=550557746592
