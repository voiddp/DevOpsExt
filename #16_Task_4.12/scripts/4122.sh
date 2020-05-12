#!/bin/bash
#Task 4.12.2 MD5 SUMMS
arch_dir=~/tmp/scripts/4122Project
proj_dir=~/tmp/scripts/4122Project/mf
proj_name=mf
md5file=${arch_dir}/${proj_name}.md5
compiler=g++
prog=make
#####  check programs asking to install  #####
for pr in ${compiler} ${prog}
do
	if ! command -v ${pr} >/dev/null 2>&1
 	then
    		echo "#### need ${pr} to work"
    		echo "#### to install with sudo (y\n)? :"
    		read
 		if [[ "${REPLY}" == "y" ]]
			then
			sudo apt-get install ${pr}
		fi;fi;done

###  first launch if there is no md5 file ######
if [ ! -f ${md5file} ]
then
  echo "##### gener. md5 file... : ${md5file}"
  find ${proj_dir} -type f -exec md5sum {} \; > ${md5file}
  arch_file=${arch_dir}/$(date '+%d%m%Y_%H%M%S')_${proj_name}.tar.gz
  echo "##### Creating archive... ${arch_file}"
  tar -czf ${arch_file} ${proj_dir}/* ${md5file}
fi
##### SLEEP CYCLE 20s  #####
while : ; do
sleep 20
#checking md5 summs
if  ! md5sum -c --status ${md5file}
then
    echo "##### Change!!!: generating new md5 in archive"
    find ${proj_dir} -type f -exec md5sum {} \; > ${md5file}
    arch_file=${arch_dir}/$(date '+%d%m%Y_%H%M%S')_${proj_name}.tar.gz
    echo "##### Creating archive ${arch_file}"
    tar -czf ${arch_file} ${proj_dir}/* ${md5file}
    echo "##### recompiling Project: ${proj_name}"
    cd ${proj_dir}
    make -f Makefile-3
    echo "##### new md5 after compilation ${md5file}"
    find ${proj_dir} -type f -exec md5sum {} \; > ${md5file}
#remove results: make -f Makefile-3 clean
else
    echo "##### $(date '+%D %T'): nothing changed"
fi
done
