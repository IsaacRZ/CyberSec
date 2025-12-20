#Brutus.zip
#=====================
#       Parte I: 
#=====================
#=====================
#       Parte II: Grok  
#=====================
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


grep 'session' auth.log
grep 'session' auth.log | grep -v 'cron'

grep 'systemd-logind' auth.log

grep '65.2.161' auth.log | grep 'Failed password'
grep '65.2.161' auth.log | grep 'Failed password' | wc -l
    # wc -l : cuenta numero de lineas



# ----------------------------------------------------------------------------
# NOTAS FINALES SOBRE LOS COMANDOS
# ----------------------------------------------------------------------------

#/etc/shadow/ -> Hashes de todas las contraseñas(Huella digital)

# GREP FLAGS IMPORTANTES:
# -v: invierte la búsqueda (muestra lo que NO coincide)
# -i: ignora mayúsculas/minúsculas
# -o: muestra solo la parte que coincide
# -P: usa regex de Perl
# -A N: muestra N líneas después de cada coincidencia
# -B N: muestra N líneas antes de cada coincidencia

# AWK:
# awk '{print $N}' : imprime el campo N de cada línea
# Los campos se numeran desde $1, $0 es la línea completa

# SED:
# sed 's/patrón/reemplazo/' : sustituye patrón por reemplazo
# Use \ para escapar caracteres especiales

# SORT:
# sort : ordena alfabéticamente
# sort -r : ordena en reversa
# sort -n : ordena numéricamente
# sort -rn : ordena numéricamente en reversa (mayor a menor)

# UNIQ:
# uniq -c : cuenta líneas consecutivas idénticas
# DEBE usarse después de sort para funcionar correctamente

# PIPES (|):
# Conectan la salida de un comando con la entrada del siguiente
# Permiten encadenar transformaciones de datos

# REDIRECCIÓN (>):
# comando > archivo : guarda la salida en un archivo (sobrescribe)
# comando >> archivo : agrega la salida al final de un archivo

# LESS:
# Paginador para ver archivos grandes
# / para buscar, n para siguiente resultado, q para salir

# HEAD:
# head : muestra las primeras 10 líneas
# head -N : muestra las primeras N líneas

# TAIL:
# tail : muestra las últimas 10 líneas
# tail -N : muestra las últimas N líneas

#GROK
# Problema de logs no estructurados, dificil extraer patrones con awk
# Grok convierte texto no estructurado a JSON estructurado
# Para consultar facilmente con jq, Elasticsearch/Splunk, Logstash, Splunk, Graylog, otras SIEM

