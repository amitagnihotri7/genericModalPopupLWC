echo "Logging into Salesforce Org"
mkdir keys

openssl aes-256-cbc -k $CERT_KEY -in keys/server.key.enc -out keys/server.key -d

echo "Authenticating org"
sfdx force:auth:jwt:grant --clientid $APP_KEY --jwtkeyfile keys/server.key --username $SF_USERNAME --setdefaultdevhubusername -a DevHub
