
source ./set_p.sh


sleep 7
echo
echo _____________________________________________________________________________________
echo
echo Creating service account
echo 
sleep 2

gcloud iam service-accounts create dbt-tool-bq-sa \
    --description="Service Account for DBT Tool Access to BQ" \
    --display-name="DBT Tool SA BQ"

#gcloud iam service-accounts create SERVICE_ACCOUNT_ID \
    #--description="DESCRIPTION" \
    #--display-name="DISPLAY_NAME"

#gcloud iam service-accounts create delete-me-mrashid \
    #--description="delete me" \
    #--display-name="delete me mrashid"


