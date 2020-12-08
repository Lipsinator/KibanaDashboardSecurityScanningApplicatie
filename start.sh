#! /bin/bash
#=======================================================================#
# Dashboard applicatie - Christiaan Lips 				#
#=======================================================================#
# CHANGELOG 								#
#=======================================================================#
# 2-12-2020 - ADDED - Merged all previous work into this script. This script now get the logs from the cluster through SCP.
#		      The ELK stack gets deployed and the database is cleard and then filled with the logs.
#		      After all the logs are uploaded to the elasticsearch database the kibana dasboard can be used on 'http://localhost:5601'
# 8-12-2020 - ADDED - errors are being send to 'errorlog.txt' file.

clear
mkdir SecurityLogs 2> errorlog.txt

# Get the location the scan logs need to be transfered to.
PWD=`pwd`
logDestination="${PWD}/SecurityLogs/"

read -p "Please enter the scp address of the cluster where the logs are generated (including path of the Securityscanlogs folder and all log files that you want to transfer): " scpAddress

# Use SCP to transfer the logs from the Cluster to the local folder
scp $scpAddress $logDestination &&

# Start elastic in a seperate terminal window.
gnome-terminal --title="Elasticsearch" -- ELK/elasticsearch-7.10.0/bin/elasticsearch
sleep 20

# Start kibana in a seperate terminal window.
gnome-terminal --title="Kibana" -- ELK/kibana-7.10.0-linux-x86_64/bin/kibana
sleep 10

# Remove olde sincedb files before launching logstash.
rm ELK/logstash-7.10.0/data/plugins/inputs/file/.sincedb_*

# Remove old logs from the elasticsearch database
curl -X DELETE "localhost:9200/lips_team-redhatcloud" 2> errorlog.txt
curl -X DELETE "localhost:9200/lips_team-kubehuntercloud" 2> errorlog.txt

# Start logstash to upload the kubehunter logs to elasticsearch. 
gnome-terminal --title="Logstash Kube-Hunter" -- ELK/logstash-7.10.0/bin/logstash -f LogstashConfigurationFiles/kubehunter.conf
sleep 30

# Kill the logstash instance after the logs are uploaded to elasticsearch.
logstashPID=` netstat -antp 2>/dev/null | grep 9600 | awk '{print $7, $8}' | cut -f1 -d"/"`
kill -9 $logstashPID

# Start logstash to upload the quay container security logs to elasticsearch.
gnome-terminal --title="Logstash Quay" -- ELK/logstash-7.10.0/bin/logstash -f LogstashConfigurationFiles/quay.conf
sleep 30

# Kill the logstash instance after the logs are uploaded to elasticsearch.
logstashPID=` netstat -antp 2>/dev/null | grep 9600 | awk '{print $7, $8}' | cut -f1 -d"/"`
kill -9 $logstashPID 

clear
echo "All data is succesfully transfered to your local elasticsearch database."
echo "Visit 'http://localhost:5601' for the kibana dashboard"

# After user input kill the instances of Kibana en Elasticsearch.
read -p "Press any key to close this script..."
