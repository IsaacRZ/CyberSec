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
        #  -p- : Full range of ports
        #  -sV : Detect versions of services

