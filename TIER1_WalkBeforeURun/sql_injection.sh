#SQL Injection against SQL DataBase 

#he data they collect or serve needs to be stored somewhere. Data could be usernames, passwords, posts, messages, or more
#sensitive sets such as PII (Personally Identifiable Information), which is protected by international data privacy laws. Any enterprise with a disregard towards protecting its users' PII is welcomed with very hefty
#fines from international regulators and data privacy agencies

#Apache Server: OpenSource
# Ports: 80 TCP, 443 TCP
# Alt: 8080 TCP, 8000 TCP

#HTTP (Hypertext Transfer Protocol)
# App-layer protocol 
# Transmitting hypermedia, such as HTML

# Apache httpd service, which is 2.4.38
# -> Search vulnerabilities for that version.

#GOBUSTER
apt install gobuster
git clone https://github.com/OJ/gobuster.git
go get && go build
go install 
cd /usr/share/wordlists
git clone https://github.com/danielmiessler/SecLists.git

go buster --url http://10.129.48.133/ --wordlsit /usr/share/wordlists/SecLists