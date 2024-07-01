

source ./set_p.sh


#perimeter_name   = "sp_d_shared_restricted_default_perimeter_7d13"
#environment      = "development"
#region_primary   = "us-central1"
#zone_primary     = "us-central1-c"
#region_secondary = "us-west4"
#zone_secondary   = "us-west4-c"


echo _________________________________
#gcloud composer environments list --locations  us-central1
#create_cmd_body       = "composer environments update ${module.composer.composer_env_name} --location ${var.region_primary} --update-env-variables=COMPOSER_BUCKET=${module.composer.composer_gcs_bucket}"
gcloud composer environments update  composer-development --location us-central1 --update-env-variables=FOOVAR=barfoo



exit 0
exit 0

# that is why I don't env_variables within the module directly
module "gcloud_composer_bucket_env_var" {
  source  = "terraform-google-modules/gcloud/google"
  version = "~> 2.0"

  platform              = "linux"
  additional_components = ["kubectl", "beta"]

  create_cmd_body       = "composer environments update ${module.composer.composer_env_name} --location ${var.region_primary} --update-env-variables=COMPOSER_BUCKET=${module.composer.composer_gcs_bucket}"
}
