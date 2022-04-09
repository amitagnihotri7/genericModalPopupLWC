echo "Logging into Salesforce Org"
mkdir keys
echo $CERT_KEY | base64 -di > server.key

echo "Authenticating org"
sfdx force:auth:jwt:grant --clientid 3MVG9d8..z.hDcPJp1XxaHy.52_Bvi0AiHtFPZS5dNmy_SYOkAYujCXm_OUODo83VDDZVofR4LVtXXgqepfYb --jwtkeyfile server.key --username amitagnihotri7@gmail.com --setdefaultdevhubusername -a DevHub
