# logs you into the AWS web console using a CloudTamer api token from ct.sh
# src: @navapbc-jaekim

function aws_login() {
  source ./.aws_secrets.sh

  echo "DevSecOps: $DEVSECOPS_ACCT_NBR"
  echo "Jenkins Dev: $JENKINS_DEV_ACCT_NBR"
  echo "Jenkins Prod: $JENKINS_PROD_ACCT_NBR"

  echo -n "Enter AWS account number: "
  read AWS_ACCT_NUM

  echo -n "Enter CloudTamer username: "
  read CT_USERNAME

  echo -n "Enter CloudTamer password: "
  read -s CT_PASSWORD
  echo

  CT_TOKEN=$(curl -s --location --request POST 'https://cloudtamer.cms.gov/api/v2/token' \
    --header 'Content-Type: application/json' \
    --data-raw '{
      "username": "'"${CT_USERNAME}"'",
      "password": "'"${CT_PASSWORD}"'",
      "idms": {
          "id": 2
      }
  }' | jq -r '.data.access.token') # .data.user_id

  CUSTOM_AWS_URL=$(curl -s --location --request POST 'https://cloudtamer.cms.gov/api/v1/console-access' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer '"${CT_TOKEN}"'' \
    --data-raw '{
    "account_number": "'"${AWS_ACCT_NUM}"'",
    "rold_id": 29,
    "role_type" : "ou",
    "aws_iam_role_name": "'"${AWS_IAM_ROLE_NAME}"'",
    "account_type_id": 1
}' | jq -r '.data')

  echo $CUSTOM_AWS_URL
  open -a "Google Chrome" $CUSTOM_AWS_URL
}
