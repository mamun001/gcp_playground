
echo dev-perm-arango-1 >  ./tmp.projects
echo foo-rehersal >> ./tmp.projects
echo foo-preview >> ./tmp.projects
echo foo-concert >> ./tmp.projects
echo arc-eu-primary-cluster >> ./tmp.projects
echo foo-prod-jp-fde95641 >> ./tmp.projects



while read p; do
  echo ______________________________________________________________________________________________________
  echo "$p"
  gcloud compute addresses list --project  $p 
  #gcloud compute addresses list --project  $p  | egrep "ing|fan"
  echo
done <./tmp.projects


exit 0

#__________________________________________________________-
#display_name,project,starting_urls,scan_rehearsal_url
#Rehersal,foo-rehersal,https://int-rehersal.foo.ninja/
#Preview,foo-preview,https://preview.foo.com/
#Production US,foo-concert,https://manage.foo.com/
##Production EU,foo-prod-eu,https://manage-eu.foo.com/
#Production JP,foo-prod-jp,https://manage.jp.foo.com/


#  35.227.217.255  : US manage.foo.com    ingress-fanout-foo-com                          35.227.217.255  foo-concert project
#     runnning: will it finish?


# eu:  35.244.210.214
#arc-eu-primary-cluster
#  https://manage-eu.foo.com/
#  COULD NOT FIND THE IP IN ANY PROJECT


#  34.120.110.169  jp found project
#   all done (via terraform even)



# preview?
#35.190 found


exit 0


