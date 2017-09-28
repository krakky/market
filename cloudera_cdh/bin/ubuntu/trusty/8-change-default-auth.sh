echo "Waiting for <CLOUDERA MANAGER> to be available on <PORT> 7180 ..."

while true; do
	nc 127.0.0.1 7180 < /dev/null
	if [ $? -eq 0 ]; then
		break
    fi
	echo "Waiting..."
    sleep 1
done

echo "<CLOUDERA MANAGER> has been successfully launched and is available for use !"
sleep 1


#== DO THE FANCY AUTH THING ==
echo "Creating new authentication credentials <acm:SCALE42secretly> !"
curl -X POST -u 'admin:admin' http://127.0.0.1:7180/api/v5/users -H 'accept: application/json' -H 'Content-Type: application/json' -d '{ "items" : [{"name" : "acm", "password" : "SCALE42secretly", "roles": ["ROLE_ADMIN"] }]}'

echo "Deleting the old default cloudera authentication credentials <acm:acm> !"
curl -X DELETE -u 'acm:SCALE42secretly' http://127.0.0.1:7180/api/v5/users/admin -H 'accept: application/json' -H 'Content-Type: application/json'  