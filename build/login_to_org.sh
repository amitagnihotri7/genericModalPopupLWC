echo "Logging into Salesforce Org"
mkdir keys
echo $CERT_KEY | base64 -di > server.key

echo "Authenticating org"
sfdx force:auth:jwt:grant --clientid $APP_KEY --jwtkeyfile server.key --username $SF_USERNAME --setdefaultdevhubusername -a DevHub