
source ./set_p.sh

echo ____________________________________________
echo PROJECT=$PROJECT
echo
sleep 5


echo ____________________________________________
echo
echo ENTER GCP USER email e.g. johdoe@foo.com
read EMAIL
echo




echo ____________________________________________
echo
echo
gcloud projects get-iam-policy $PROJECT >  ./tmp.iam
echo
echo

echo ____________________________________________
egrep "role|$EMAIL"  ./tmp.iam


