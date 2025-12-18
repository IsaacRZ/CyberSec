#Brutus.zip
#Password: hacktheblue
7z x Brutus.zip
#or
unzip Brutuz.zip

#Explore
ls -lh

TZ=UTC last -F -f wtmp
    # -F: Full time
    # -f: file specific
    # TZ=UTC: Always stablish TZ on UTC

#Exploracion auth.log
less auth.log
head auth.log
head -1 auth.log #Ver formato (primer linea)

#awk (pattern scan, process language)
head -1 auth.log | awk '{print $5}'
awk '{print $5}' auth.log

#sed (search and replace)   's/patrón/reemplazo/'
awk '{print $5}' auth.log  | sed 's/[:[].*//'
    # [] : opcion alternativa de busqueda     
    # :[ : busca ':' o '[' 
    # .* : todo el resto del texto y lo remplaza por / (elimina del todo)

#sort: ordenar alfabeticamente
#uniq -c: cuenta lineas consecuticas identicas
awk '{print $5}' auth.log  | sed 's/[:[].*//' | sort | uniq -c

#sort
    # -rn : -r reversa mayor a menor, -n numerico
awk '{print $5}' auth.log  | sed 's/[:[].*//' | sort | uniq -c | sort -rn

#Investigar acciones
# Buscar nuevo usuario agregado 'useradd'
grep 'useradd' auth.log
grep 'cyberjunkie' auth.log | grep 'Accepted password'
grep '06:37:34' auth.log
#sshd
grep 'sshd' auth.log | grep -v 'pam_unix' | less
grep 'sshd' auth.log | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'
    # -o  Solo parte que coincide 
    # -P  regex de Perl
    #  \d{1,3}: coincide con 1 a 3 dígitos  \. :coincide con un .
grep 'sshd' auth.log | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort | uniq -c | sort -rn
#Busqueda del ip
grep '65.2.161.68' auth.log | grep 'invalid user'
grep '65.2.161.68' auth.log | grep 'Failed'

grep 'cyber' auth.log | grep -i 'accept'
grep 'Accepted password' auth.log | grep '65.2.161.68'

grep '65.2.161.68' auth.log | grep 'Accepted password' -A 3
    # -A 3 : 3 lineas despues
    # Esto muestra si hubo desconexión inmediata (indicativo de brute force)
    # o si la sesión duró más tiempo (login manual)


grep 'systemd-logind' auth.log


