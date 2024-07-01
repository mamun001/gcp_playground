
source ~/.bashrc

# long output
#gcloud compute instances list --format=json

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
gcloud compute instances list --format='table(tags.list())'  | grep -v TAGS |  cut -d= -f4 | tr -cd '[:alnum:]- ' | sed 's/ /\'$'\n/g' | sort | uniq | sort  > ./tmp.tags
echo
cat ./tmp.tags
echo
wc -l ./tmp.tags
echo

