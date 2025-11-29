#Install redis cli and tools
apt install redis-tools

#HELP 🆘
redis-cli --help

#Connect host flag:  -h 
redis-cli -h {target_IP}

#Enumeration once we are login
        info
            #keyspace section info about DB
            #db0
        select 0
        # list all the keys present in the database
        keys *
        # view the value
        get <key>
        


