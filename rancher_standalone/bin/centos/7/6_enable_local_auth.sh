#PASSED FIRST ARGUMENT {{SELF.IP}}
SELF_IPv4=$1

echo "Waiting for RANCHER to be available on <PORT> 8080 ..."
while ! $(nc --send-only </dev/null $1 8080); do
  sleep 1
  echo "Waiting.."
done

echo "RANCHER has been successfully launched and is available for use !"



#6
echo "Reading <CSRF> value from the RANCHER web application ..."
curl -X GET http://$SELF_IPv4:8080/v2-beta/token -H 'accept: application/json' -H 'accept-language: en-US,en;q=0.8' -H 'cache-control: no-cache' -H 'content-type: application/json' -H 'cookie: PL=rancher' -H 'user-agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36' -H 'x-api-action-links: actionLinks' -H 'x-api-no-challenge: true' --cookie-jar /tmp/rancher_cookiefile

#7
CSRF_RANCHER=$(cat /tmp/rancher_cookiefile | sed -n -e 's/^.*CSRF//p' | xargs)
echo "<CSRF_TOKEN> = $CSRF_RANCHER"

#8
curl -X POST http://$SELF_IPv4:8080/v2-beta/localauthconfig -H 'accept: application/json' -H 'accept-language: en-US,en;q=0.8' -H 'cache-control: no-cache' -H 'content-type: application/json' -H 'user-agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36' -H 'x-api-action-links: actionLinks' -H 'x-api-csrf: <CSRF_TOKEN>' -H 'x-api-no-challenge: true'  -d '{ "accessMode" : "unrestricted", "baseType" : "localAuthConfig", "enabled" : true, "id" : null, "name" : "Super Admin", "password" : "acm", "type" : "localAuthConfig", "username" : "acm" }' --cookie-jar /tmp/rancher_cookiefile
echo "A <SUPER_ADMIN> account has been succesfully created with the following credentials | USERNAME: <acm> and PASSWORD <acm> |"
echo "Rancher LOCAL_AUTHENTICATION mechanism has been enabled successfully !"