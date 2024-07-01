
# long output
#gcloud compute instances list --format=json

source ~/.bashrc
echo

source set_p.sh
echo


echo
echo _____________________________________________________________________________
echo list of GCE instances:
echo
# get all tags 
# -d= -f4 only get "items" tag
# take everythng except alphanumeric and - and space
# insert newline everytime you see space
# sort uniq sort
echo 
echo ALL TAGS SORTED
echo
sleep 2
gcloud compute instances list --format='table(tags.list())'  | grep -v TAGS |  cut -d= -f4 | tr -cd '[:alnum:]- ' | sed 's/ /\'$'\n/g' | sort | uniq | sort  > ./tmp.tags
cat ./tmp.tags
echo
echo
echo
sleep 2


echo
echo -n "ENTER a substring to filter out TAGS e.g. lb: "
read STR
echo
grep $STR  ./tmp.tags
echo

echo -n "ENTER EXACT TAG: "
read TAG
gcloud compute instances list --format='table(name,status,tags.list())'  | grep $TAG | sort | cut -c 1-180
echo
echo COUNT:
echo
gcloud compute instances list --format='table(name,status,tags.list())'  | grep $TAG | sort | wc -l
echo
echo


