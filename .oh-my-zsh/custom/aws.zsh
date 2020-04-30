aws-new-session-token() {
  creds=$(aws sts get-session-token | jq '.Credentials')

  export AWS_ACCESS_KEY_ID=$(echo $creds | jq -r '.AccessKeyId')
  export AWS_SECRET_ACCESS_KEY=$(echo $creds | jq -r '.SecretAccessKey')
  export AWS_SESSION_TOKEN=$(echo $creds | jq -r '.SessionToken')
}

aws-unset-session-token() {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN
}

aws-gateway-key() {
  aws apigateway get-api-keys --name-query $1 --include-value --query 'items[0].value' --output text
}

aws-detach-iot-policy() {
  policy=$1
  aws iot list-policy-principals --policy-name $policy --query 'principals' \
    | jq -r '.[]' \
    | while read id
      do
        echo "$policy: $id"
        aws iot detach-principal-policy --policy-name $policy --principal $id
      done
}

aws-delete-failed-stack-sets() {
  stack=$1
  aws cloudformation list-change-sets --stack-name $stack | jq -r '.Summaries | map(select(.Status == "FAILED")) | .[].ChangeSetId' \
    | while read id
    do
      echo "delete change set: $id"
      aws cloudformation delete-change-set --change-set-name $id
    done

}

aws-unset () {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN
}

aws-assume-role () {
  ACCOUNT=$1
  ROLE=$2
  RESULT=$(aws sts assume-role --role-arn "arn:aws:iam::${ACCOUNT}:role/${ROLE}" --role-session-name "$(whoami)-${ACCOUNT}-${ROLE}" --query 'Credentials')

  export AWS_ACCESS_KEY_ID=$(echo $RESULT | jq -r '.AccessKeyId')
  export AWS_SECRET_ACCESS_KEY=$(echo $RESULT | jq -r '.SecretAccessKey')
  export AWS_SESSION_TOKEN=$(echo $RESULT | jq -r '.SessionToken')
}


aws-ec2-list () {
  aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,ImageId,State.Name,Tags[?Key==`Name`].Value,NetworkInterfaces[0].PrivateIpAddress]'
}
