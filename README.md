# Stageopdracht: Security Scanning Applicatie Kibana Dashboard
Dit deel van de applicatie zet de verkregen log bestanden in een Elasticsearch database om deze vervolgens inzichtelijk te maken met een Kibana dashboard.

LET OP:

Deze applicatie heeft de logs van https://github.com/TheChrisKip/SecurityScanningApplicatie nodig om te kunnen funcioneren.

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
4) Zorg dat je de logbestanden van Kube-Hunter en Quay Container Security operator in de map 'SecurityLogs' hebt geplaatst.
5) In de map 'LogstashConfigurationFiles' verander in beide .conf bestanden het veld 'PATH-TO-DIRECTORY' naar het absolute pad waar de logs bestanden opgeslagen staan.
6) Voer het volgende commando uit "chmod +x start.sh".
7) Trap het start.sh script af.
8) Navigeer naar http://localhost:5601
9) Navigeer via het menu onder het kopje 'Management' naar 'Stack Management'
10) Navigeer vervolgens onder het kopje 'Kibana' naar 'Saved Objects' en kies 'Import'
11) Selecteer vannuit het import scherm het bestand 'SecurityScanningApplicatieDashboard-17-02-2020.ndjson' (Dit bestand staat in de 'KibanaDashboard' map die in het repository staat)
12) Navigeer vervolgens via het hoofdmenu naar het kopje 'Kibana' en vervolgens 'Dashboard' om het dashboard te zien.

Dit dashboard is zichtbaar zolang de Kibana instantie draait.


