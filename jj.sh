#!/bin/bash


if (( "$#" < 1 )); then echo "use -h for help."; fi

option=$1


case $option in

 -eu)
 echo "Login to EU"
 tsh login --proxy=eu-tlp.sbtech.info:443;;
 -us)
 echo "Logim to US"
 tsh login --proxy=us-tlp.sbtech.info:443;;
 -cl)
 tsh clusters ;;
 -kls)
 echo "K8s clusters"
 tsh kube ls ;;
 -kl)
 echo "Login to k8s cluwter"
 tsh kube login $2 ;;
 -ns)
 echo "Node search"
 tsh ls |awk '{print $1}'|egrep $2;;
  -nl)
 echo "List available nodes"
 tsh ls |awk '{print $1}';;
 -l)
 echo "Login via ssh."
 node=$2
 tsh ssh root@$node ;;
 -jae)
 echo "Connecting to ansibele EU."
 tsh ssh root@cip-lt-ansible-1;;
 -jau)
 echo "Connecting to ansibele US."
 tsh ssh root@njp-lt-ansible-1;;
 -cpe)
 $2=file
 $3=node
 tsh scp --proxy=eu-tlp.sbtech.info:443 $file $node:~;;
 -cpu)
 $2=file
 $3=node
 tsh scp --proxy=us-tlp.sbtech.info:443 $file $node:~;;
 -s)
 tsh status;;
 -lo)
 tsh logout ;;
 -h)
 echo "Use -eu to EU or -us for US"
 echo "Use -kls to list k8s clusters"
 echo "Use -kl to login to k8s cluster"
 echo "Use -cl to list clusters, -nl to list nodes, use -login to login via ssh."
 echo "Use -ns to search for node"
 echo "Use -s to see tsh status."
 echo "Use -l to loggo via ssh to neode"
 echo "Use -jae to login ansible EU"
 echo "Use -jau to login ansible US"
 echo -n "Use -cpe or -cpu for region to make scp with parmas \$2=file \$3=node."
 echo "Use -lo to logout from teleport destination."


esac
