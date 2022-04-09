echo "Logging into Salesforce Org"
mkdir keys

echo $CERT_KEY | base64 -r -ps >> keys/server.key
            openssl rsa -in keys/server.key -check -noout
echo "Authenticating org"
sfdx force:auth:jwt:grant --clientid $APP_KEY --jwtkeyfile keys/server.key --username $SF_USERNAME --setdefaultdevhubusername -a DevHub
