#!/usr/bin/python

from cm_api.api_client import ApiResource
import time

api = ApiResource(sys.argv[1], 7180, "acm", "SCALE42secretly", version=15)

cluster = None
try:
	cluster = api.get_cluster(name = "ACM Cluster")
except Exception, e:
	if e.message[-10:-1].lower() == "not found":
		print "<ACM CLUSTER> NOT FOUND ! - not proceeding any further..."
		exit()

#Find available parcels...
available_parcels = cluster.get_all_parcels()

CDH_TARGET = None
for p in available_parcels:
        if p.product.lower() == "cdh" and p.version[:1] == "5":
                CDH_TARGET = { "name" : p.product, "version" : p.version }
                break

if CDH_TARGET is not None:
	parcel = cluster.get_parcel(CDH_TARGET['name'] , CDH_TARGET['version'])
	if parcel.stage == "ACTIVATED":
		print "Parcel <{0}-v{1}> is already <ACTIVATED> across the entire cluster !".format(CDH_TARGET['name'] , CDH_TARGET['version'])
	elif parcel.stage == "DISTRIBUTED":
		try:
			print "Activating <{0}-v{1}> parcel across the cluster !".format(CDH_TARGET['name'] , CDH_TARGET['version'])
			parcel.activate()
			time.sleep(10)
			#Restart the ACM cluster
			print "Restarting <{0}> cluster through the cloudera manager !".format(cluster.name)
			cluster.stop().wait()
			cluster.start().wait()
			print "Ready to start rolling with Cloudera Managaer and <ACM Cluster> !"
			
		except Exception, e:
			print "Unable to activate parcel <{0}-v{1}> and restart cluster !!! reason : {2}".format(CDH_TARGET['name'] , CDH_TARGET['version'], e.message)
else:
	print "We were unable to target any CDH-5 parcel available remotely !"