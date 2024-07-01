
# 
# login to GCR if you haven't already setup that up: 
gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://gcr.io
# run the new version of the image locally:  
docker run -it --rm gcr.io/cicd/sre-cicd-apps-cicd-tfhelm:1.1.0 
