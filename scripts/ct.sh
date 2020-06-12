# generates fresh CloudTamer api keys for AWS console login
# src: @navapbc-jaekim

function ct() {
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

  # this script assumes only one api key exists at a time
  CURR_APP_KEY=$(curl -s --location --request GET 'https://cloudtamer.cms.gov/api/v3/app-api-key' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer '"${CT_TOKEN}"'' | jq -r '.data[0].id')

  NEW_KEY=$(curl -s --location --request POST 'https://cloudtamer.cms.gov/api/v3/app-api-key' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer '${CT_TOKEN} \
    --data-raw '{
        "name":"appkey"
    }' | jq -r '.data.key')
  echo "CloudTamer API key refreshed."

  echo CTKEY=$NEW_KEY > ~/.zshenv

  export CTKEY=$NEW_KEY

  source ~/.zshenv

  curl -s -X DELETE "https://cloudtamer.cms.gov/api/v3/app-api-key/${CURR_APP_KEY}" -H "accept: application/json" -H "Authorization: Bearer ${CT_TOKEN}" >/dev/null
}
