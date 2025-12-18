#=======================================================================
#                         ENUMERATION 
#=======================================================================
# User input for target ip
read -p "Enter target IP: " target_ip
#       Verify the connectivity & availability of the target ICMP
ping "$target_ip"

#       Scan of the target
nmap -p- -sV "$target_ip"

        #  nmap: Scan 
        #  -p- : Full range of ports [Port 1 - Port 65535]
        #  -sV : Detect versions of services

#       Scan of the target 
nmap -p- --min-rate=1000 -T4 "$target_ip"

#  --min-rate=1000 :    Acelera escaneo enviando al menos 1000 paquetes por segundo
        #  -sC :    ejecuta los scripts de reconocimiento Nmap. Verifica vulnerabilidades comunes  y enumeración de puertos
        #  -sS :    SYN stealth. temporización lenta -> Menos probable activar IDS
        #  -T4 :    Acelera el escaneo usando plantillas de temporización más agresivas. IDS -> interpretan como ataque
        #  -T2 :    Detect versions of services 

