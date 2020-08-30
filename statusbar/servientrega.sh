wget -O - -o /dev/null -q "http://www.solucionservientrega.com/(S(u1sonftitpgsm51unjwormjg))/TrackEnvios.aspx?ID=3007988666"  | grep 'td' | grep ':'  | sed -e 's/<[^>]*>/~/g'| tail -n 1 | cut -d'~' -f2,6

