#!/bin/bash

rm /home/sysadmin/scripts/for_loop_permissions.txt

files=(
'/etc/passwd'
'/etc/shadow'
)

#Display permissions
echo -e "\nThe permissions for sensitive /etc files: \n" >> /home/sysadmin/scri$

for file in ${files[@]}
do
        ls -l $file >> /home/sysadmin/scripts/for_loop_permissions.txt
done
