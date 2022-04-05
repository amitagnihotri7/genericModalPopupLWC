echo "Generating certificates for use with CircleCI, press enter to continue"
read check1
openssl genrsa -des3 -passout pass:9919471952aa12 -out server.pass.key 2048
openssl rsa -passin pass:9919471952aa12 -in server.pass.key -out server.key
rm server.pass.key
echo "We will now generate the server key, when promoted for a password, press enter"
echo "press enter to continue"
read check2
openssl req -new -key server.key -out server.csr
echo "we will now generate the certificates, press enter to continue"
openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt
echo "the key will now be encoded in BASE64 and displayed, use the output for the value of SFDC_SERVER_KEY enviornment variable"
echo "/n"
echo "press enter to continue"
read check4
#certutil -encode server.key encodedkey.txt
base64 server.key
echo "we will now clean up, keys will be deleted"
echo "press enter to continue"
read check4
rm server.csr
rm server.key
echo "certificate and key generateion complete, please add server.crt to your OAuth connected app in salesforce"


sfdx force:auth:jwt:grant --clientid 3MVG9d8..z.hDcPJp1XxaHy.52_Bvi0AiHtFPZS5dNmy_SYOkAYujCXm_OUODo83VDDZVofR4LVtXXgqepfYb 
--jwtkeyfile server.key --username amitagnihotri7@gmail.com --instanceurl https://amitagnihotri-dev-ed.my.salesforce.com/
