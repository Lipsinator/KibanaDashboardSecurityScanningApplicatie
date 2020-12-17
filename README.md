# Stageopdracht: Security Scanning Applicatie Kibana Dashboard
Dit deel van de applicatie zet de verkregen log bestanden in een Elasticsearch database om deze vervolgens inzichtelijk te maken met een Kibana dashboard.

# Requirements aan computer
- PC moet Linux draaien
- PC moet internet toegang hebben
- Root access op de pc

# Installatie
1) Clone deze repository naar je Linux laptop.
2) Download Elasticsearch, Logstash and Kibana:
- https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.1-linux-x86_64.tar.gz
- https://artifacts.elastic.co/downloads/logstash/logstash-7.10.1-linux-x86_64.tar.gz
- https://artifacts.elastic.co/downloads/kibana/kibana-7.10.1-linux-x86_64.tar.gz
3) Pak de bestanden uit naar de map 'KibanaDashboardSecurityScanningApplicatie'.
4) In de map 'LogstashConfigurationFiles' verander in beide .conf bestanden het veld 'PATH-TO-DIRECTORY' naar het absolute pad waar de logs bestanden opgeslagen staan.
4) Voer het volgende commando uit "chmod +x start.sh".
5) Trap het start.sh script af.
6) Navigeer naar http://localhost:5601
7) 
