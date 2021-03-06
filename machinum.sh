#!/bin/bash

# M A C H I N U M
# Script to enumerate a Linux machine
# created by Sc00by

# Colours ~makeitgood~
NORMAL=$(echo -e "\033[1;0m")
GREEN=$(echo -e "\033[1;32m")
BLUE=$(echo -e "\033[1;34m")
MAGENTA=$(echo -e "\033[1;35m")
CYAN=$(echo -e "\033[1;36m")

# DONT LOOK AT THIS HIDEOUSNESS
echo "$BLUE"
echo    "<>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<>"
echo    "||                                   ||"
echo -n "||"
echo -n "$GREEN"
echo -n "           Machinum v0.01"
echo -n "$BLUE"
echo    "          ||"
echo -n "||"
echo -n "$CYAN"
echo -n "              by Sc00by"
echo -n "$BLUE"
echo    "            ||"
echo    "||                                   ||"
echo    "<>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<>"
# END HIDEOUSNESS

echo "$GREEN"
echo -e "Start time:"
echo -ne "$NORMAL\t"
date

# # # S Y S T E M # # #
echo "$BLUE"
echo -n "<>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<>"
echo "$GREEN"
echo -n "##"
echo -n "$NORMAL"
echo -n "~~~~~~~~~~~~~~"
echo -n "$GREEN"
echo -n " SYSTEM "
echo -n "$NORMAL"
echo -n "~~~~~~~~~~~~~~"
echo -n "$GREEN"
echo "##"
echo -n "$BLUE"
echo    "<>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<>"

# current userid
curruser=`whoami 2>/dev/null`
if [ "$curruser" ]; then
	echo "$MAGENTA"
	echo -n "Effective userid: "
	echo "$NORMAL"
	echo "$curruser"
fi

# Hostname of current machine
currhost=`hostname 2>/dev/null`
if [ "$currhost" ]; then
        echo "$MAGENTA"
        echo -n "Effective hostname: "
        echo "$NORMAL"
        echo "$currhost"
fi

# system information
gensysinfo=`uname -a 2>/dev/null`
if [ "$gensysinfo" ]; then
	echo "$MAGENTA"
	echo -n "System information: "
	echo "$NORMAL"
	echo "$gensysinfo"
fi

# Kernal information
procv=`cat /proc/version 2>/dev/null`
if [ "$procv" ]; then
	echo "$MAGENTA"
	echo -n "Extended kernel information:"
	echo "$NORMAL"
	echo "$procv"
fi

sleep 1

# # # # U S E R ? G R O U P # # # #

echo
echo "$BLUE"
echo -n "<>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<>"
echo "$GREEN"
echo -n "##"
echo -n "$NORMAL"
echo -n "~~~~~~~~~~~~~~"
echo -n "$GREEN"
echo -n " USER/GROUP "
echo -n "$NORMAL"
echo -n "~~~~~~~~~~~~~~"
echo -n "$GREEN"
echo "##"
echo -n "$BLUE"
echo    "<>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<>"


# current userid (id-wise)
userid=`id 2>/dev/null`
if [ "$userid" ]; then
	echo "$MAGENTA"
	echo -n "Current User details: "
	echo "$NORMAL"
	echo "$userid"
fi

# last logged on user
lastlog=`lastlog | grep -v "Never" 2>/dev/null`
if [ "$lastlog" ]; then
	echo "$MAGENTA"
	echo -n "Last user logged on: "
	echo "$NORMAL"
	echo "$lastlog"
fi

# fetches username uid and gid from /etc/passwd
userinfo=`cat /etc/passwd | cut -d ":" -f 1,2,3,4 2>/dev/null`
if [ "$userinfo" ]; then
	echo "$MAGENTA"
	echo -n "UID / GID values: "
	echo "$NORMAL"
	echo "$userinfo"
fi

# ids and respective groups
usergrpinfo=`for i in $(cat /etc/passwd 2>/dev/null| cut -d ":" -f1 2>/dev/null);do id $i;done 2>/dev/null`
if [ "$usergrpinfo" ]; then
	echo "$MAGENTA"
	echo -n "User's groups: "
	echo "$NORMAL"
	echo "$usergrpinfo"
fi

# password hashes in /etc/passwd?
hashespwdf=`grep -v '^[^:]*:[x]' /etc/passwd 2>/dev/null`
if [ "$hashespwdf" ]; then
	echo "$GREEN"
	echo -n "Password hashes found in \'/etc/passwd\'"
	echo "$NORMAL"
	echo "$hashespwdf"
fi

# can we see the /etc/shadow file?
shadow=`cat /etc/shadow 2>/dev/null`
if [ "$shadow" ]; then
	echo "$GREEN"
	echo -n "\'/etc/shadow\' file can be read!"
	echo "$NORMAL"
	echo "$shadow"
fi
