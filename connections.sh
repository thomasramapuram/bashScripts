curr_date=`date +"%d/%m/%Y,%H:%M"`;
read var < /var/log/var.txt;
if ((ping -w5 -c3 8.8.8.8 || ping -w5 -c3 4.2.2.1) > /dev/null 2>&1)
then
  echo "Ping True: $var"
  if [ "$var" != "Up" ]
  then
    var="Up";
    echo "${curr_date},$var" >> /var/log/connection.log;
    echo $var > /var/log/var.txt;
  fi
else
  #Do things to log you on to the server;
  echo "Ping True: $var"
  if [ "$var" != "Down" ]
  then
    var="Down";
    echo "${curr_date},$var" >> /var/log/connection.log;
    echo $var > /var/log/var.txt;
  fi
fi

