# Spf recursive lookup

getspf() {
  if [ -z $1 ]; then
    echo "getspf <domain>"
  else
    dig $1 txt | grep "^$1" | sed 's/^.*TXT[\t]*"//g;s/"$//g' | tr ' ' '\n' | while read line; do
      if [[ $line =~ ^ip ]]; then
        echo $line | sed 's/^ip[46]://g'
      elif [[ $line =~ ^ptr ]]; then
        echo $line | sed 's/ptr://g'
      elif [[ $line =~ ^include ]]; then
        getspf $(echo $line | sed 's/^include://g')
      elif [[ $line =~ ^redirect ]]; then
        getspf $(echo $line | sed 's/^redirect=//g')
      else
        continue
      fi
    done
  fi
}
