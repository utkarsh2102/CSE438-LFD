#!/bin/zsh

if [[ $# -eq 0 ]]
then
{
  # check if connected to internet or not
  ping -c 1 google.com &> /dev/null && echo -e "Internet: Connected" || echo -e "Internet: Disconnected"

  # check OS type
  os=$(uname -o)
  echo -e "Operating System Type:" $os

  # check OS release version and name
  cat /etc/os-release | grep 'NAME\|VERSION' | grep -v 'VERSION_ID' | grep -v 'PRETTY_NAME' > /tmp/osrelease
  echo -n -e "OS Name: " && cat /tmp/osrelease | grep -v "VERSION" | cut -f2 -d\"
  echo -n -e "OS Version: " && cat /tmp/osrelease | grep -v "NAME" | cut -f2 -d\"

  # check architecture
  architecture=$(uname -m)
  echo -e "Architecture:" $architecture

  # check kernel release
  kernelrelease=$(uname -r)
  echo -e "Kernel Release:" $kernelrelease

  # check hostname
  echo -e "Hostname:" $(hostname)

  # check internal IP
  internalip=$(hostname -I)
  echo -e "Internal IP:" $internalip

  # check external IP
  externalip=$(curl -s ipecho.net/plain;echo)
  echo -e "External IP: " $externalip

  # check DNS
  nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}' | tail -n1)
  echo -e "Name Servers:" $nameservers

  # check logged-in users
  who>/tmp/who
  echo -e "Logged In users:" && cat /tmp/who

  # check RAM and SWAP usages
  free -h | grep -v + > /tmp/ramcache
  echo -e "Ram Usages:"
  cat /tmp/ramcache | grep -v "Swap"
  echo -e "Swap Usages:"
  cat /tmp/ramcache | grep -v "Mem"

  # check disk usages
  df -h| grep 'Filesystem\|/dev/nvme0n1p**' > /tmp/diskusage
  echo -e "Disk Usages:"
  cat /tmp/diskusage

  # check load average
  loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
  echo -e "Load Average:" $loadaverage

  # check system uptime
  totuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
  echo -e "System Uptime in (HH:MM):" $totuptime

# unset variables
unset os architecture kernelrelease internalip externalip nameserver loadaverage

# remove temporary files
rm /tmp/osrelease /tmp/who /tmp/ramcache /tmp/diskusage
}
fi
shift $(($OPTIND -1))
