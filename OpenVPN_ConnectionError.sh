#Multiples interfaces tun -> Residuales

#Verificar interfaces tun
ip route show

#Ping Gateway VPN
    #ping -c 4 10.10.14.1
ping -c 4 {vpn gateway ip}

#Limpiar openvpn y interfaces tun
sudo killall openvpn

sudo ip link delete tun0
sudo ip link delete tun1
sudo ip link delete tun2
sudo ip link delete tun3
#.
#.

#Verificar 
ip addr show | grep tun
ip route show
ping -c 4 {vpn gateway ip}

#Reconectar
sudo openvpn starting_point_user.ovpn
