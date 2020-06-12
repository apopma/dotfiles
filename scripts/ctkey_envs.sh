function jenkinsdev() {
  source ~/repos/dotfiles/scripts/.aws_secrets.sh
  ctkey setenv --url=https://cloudtamer.cms.gov --account=$JENKINS_DEV_ACCT_NBR --cloud-access-role=$AWS_CLOUD_ACCESS_ROLE --app-api-key=$CTKEY
}

function jenkinsprod() {
  source ~/repos/dotfiles/scripts/.aws_secrets.sh
  ctkey setenv --url=https://cloudtamer.cms.gov --account=$JENKINS_PROD_ACCT_NBR --cloud-access-role=$AWS_CLOUD_ACCESS_ROLE --app-api-key=$CTKEY
}
