#!/usr/bin/python

from cm_api.api_client import ApiResource
import sys, time

api = ApiResource(sys.argv[1], 7180, "acm", "SCALE42secretly", version=15)
excpected_hosts = sys.argv[2:]
excpected_hosts_count = len(excpected_hosts)

cluster = None

try:
	cluster = api.get_cluster(name = "ACM Cluster")
except Exception, e:
	if e.message[-10:-1].lower() == "not found":
		#CLUSTER YET NOT CREATED -> create it
		cluster = api.create_cluster(name = "ACM Cluster", version = "CDH5")
		
		while True:
			#make sure every comissioned hosts is part of the cluster !!!
			print "Waiting for the <{0}> worker nodes of the cluster to be ready with their SCM configured AGENT...".format(excpected_hosts_count)
			hosts = api.get_all_hosts()
			#get the IP-Adress of every hosts comissioned
			actual_host_ips = list(set([ str(h.ipAddress) for h in hosts ]))
			verify_hosts = [ eh in actual_host_ips for eh in excpected_hosts ]
			if all( verify_hosts ):
				current_host_ids = [ h.hostId for h in hosts ]
				#ADDING HOSTS to the cluster
				cluster.add_hosts( current_host_ids )
				break
			time.sleep(10)
	else:
		print "Fatal error: {0}".format(e)
		print "Not going any further with the script <{0}> !".format(sys.argv[0])
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
	if parcel.stage == "AVAILABLE_REMOTELY":
		print "Starting to download <{0}-v{1}> parcel locally !".format(CDH_TARGET['name'] , CDH_TARGET['version'])
		parcel.start_download()
		#---------------------
		while True:
			parcel = cluster.get_parcel(CDH_TARGET['name'] , CDH_TARGET['version'])
			print "Download progress: %s out of %s !" % (parcel.state.progress, parcel.state.totalProgress)
			if parcel.stage == "DOWNLOADED":
				break
			time.sleep(10)
		#-------------------
		print "The <{0}-v{1}> parcel was successfully downloaded locally !".format(CDH_TARGET['name'] , CDH_TARGET['version'])	
		
	if parcel.stage == "DOWNLOADED":
		print "Starting to distributed local parcel <{0}-v{1}> across nodes of cluster !".format(CDH_TARGET['name'] , CDH_TARGET['version'])
		parcel.start_distribution()
		#-------------------
        while True:
			parcel = cluster.get_parcel(CDH_TARGET['name'] , CDH_TARGET['version'])
			print "Distribution progress: %s out of %s !" % (parcel.state.progress, parcel.state.totalProgress)
			if parcel.stage == "DISTRIBUTED":
				break
			time.sleep(10)
		#-------------------
	else:
		if parcel.stage == "DISTRIBUTED":
			print "The <{0}-v{1}> parcel is already distributed across the hosts !".format(CDH_TARGET['name'] , CDH_TARGET['version'])
		else:
			print "Seems like the <{0}-v{1}> parcel is already being distributed across hosts !".format(CDH_TARGET['name'] , CDH_TARGET['version'])

else:
	print "We were unable to target any CDH-5 parcel available remotely !"