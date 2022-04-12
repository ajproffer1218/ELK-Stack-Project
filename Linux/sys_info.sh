#!/bin/bash

mkdir ~/research 2> /dev/null

echo "A Quick System Audit Script" > ~/research/sys_info.txt

echo "Todays Date is: $(date)\n" >> ~/research/sys_info.txt

echo "Machine Type Info: '$(MACHTYPE)\n'" >> ~/research/sys_info.txt

echo "Uname info: $(uname -a)\a" >> ~/research/sys_info.txt

echo  "IP Info: $(ip addr | head -9 | tail -1)\n" >> ~/research/sys_info.txt

echo "Hostname: $(hostname)" >> ~/research/sys_info.txt

echo "\n777 Files:" >> ~/research/sys_info.txt

find / -type f -perm 777 >> ~/research/sys_info.txt

echo "\nTop 10 Processes" >> ~/research/sys_info.txt

ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> ~/research/sys_info.txt

# I've made a list here of the paths to shadow and passwd.
packages=('/etc/shadow' '/etc/passwd')
# Here I've started my for loop. For any package in my packages list.
for package in ${packages[@]}
# do...
do
# this: list the details of the directory. This will include permissions.
        ls -l $package
# Once you've done that, finishing and go to the next item in the list.
done

