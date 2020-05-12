#!/bin/bash
##Task 4.12.1
if [ $# -ne 1 ]
  then
  echo "need file as argument"
  echo "line format:"
  echo "Num. Username"
  exit 1; fi
if [[ "$(id -u $(whoami))" != 0 ]]; then echo "Run script under root\sudo"; exit 1; fi
##variables
subdir=4121_danylenko
grp=utest
##creating subdir for pswd files
[ ! -d ${subdir} ] && mkdir ${subdir} &&\
 chmod o-rwx ${subdir} &&\
 echo "${subdir}/ is created for pswd files, owner $(whoami), rights: o=-rwx"
##create-check utest group for all users
groupadd -f ${grp}
echo "users will be added to group ${grp}"
echo ===========
for user in $(cut -d'.' -f2 ${1})
do
  pswd=$(openssl rand -base64 9)
  hash=$(openssl passwd -6 ${pswd})
  if sudo useradd -G ${grp} -s /bin/bash -d /home/${user} -m -p ${hash} ${user}
     then
        echo "$user - $pswd" > ${subdir}/${user}-login-password.txt
        echo "${subdir}/${user}-login-password.txt generated"
     else
        echo "Skipping... or do something else"
  fi
done
