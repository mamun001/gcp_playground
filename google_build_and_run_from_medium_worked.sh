
gcloud builds submit --tag gcr.io/cf-sandbox/quickstart-image .
  518  ## gcloud beta run deploy --image gcr.io/<PROJECT-ID>/quickstart-image
  519  gcloud beta run deploy --image gcr.io/cf-sandbox/quickstart-image

gcloud beta run services list
